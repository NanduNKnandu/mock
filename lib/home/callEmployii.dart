
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mock/home/home.dart';
import 'package:velocity_x/velocity_x.dart';
import '../modelclass/employeemodelclass.dart';
import 'employeeDetails.dart';


class callApi extends StatefulWidget {
  const callApi({super.key});

  @override
  State<callApi> createState() => _callApiState();
}

class _callApiState extends State<callApi> {
  Future<employiApi> getdata() async {
    try {
      Response response = await get(Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));
      if (response.statusCode == 200) {
        var body = employiApi.fromJson(jsonDecode(response.body));
        return body;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (err) {
      throw Exception("Failed to load data: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            } if (snapshot.hasData){
              var datas=snapshot.data!.data();
              return Column(
                children: [
                  SizedBox(height: 30,),
                  Card(
                    child: ListTile(
                    title: Center(child: Column(
                      children: [
                        Image(
                            width: 70,
                            image: NetworkImage(datas!['image'])),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            10.widthBox,
                            Text(datas!['name']),
                          ],
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call),
                            10.widthBox,
                            Text(datas!['phone number']),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.mail),
                            10.widthBox,
                            Text(datas!['email']),
                          ],
                        ),
                    
                      ],
                    )),
                                    ),
                  )],
              );

            } else{
              return SizedBox();
            }

          }
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text("Employees",style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<employiApi>(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Data>? employees = snapshot.data!.data;
            if (employees == null || employees.isEmpty) {
              return Center(child: Text("No employees found"));
            } else {
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.white60,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(employeeDetails:employees[index] ),));
                          },
                        
                          title: Text(employees[index].employeeName?? "",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Divider(),
                    ],
                  );

                },
              );
            }
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}

