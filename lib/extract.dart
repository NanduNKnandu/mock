import 'package:flutter/material.dart';

TextField buildTextField({
  required TextEditingController controller,
  required String hint,
  TextInputType keyboardType = TextInputType.text,
  bool showborder = true,
  required Color colors,
}) {
  return TextField(
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: colors),
      border: showborder
          ? OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      )
          : InputBorder.none,
    ),
  );
}













































//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'apitryModelClass.dart';
//
// class callApi extends StatefulWidget {
//   const callApi({super.key});
//
//   @override
//   State<callApi> createState() => _callApiState();
// }
//
// class _callApiState extends State<callApi> {
//   Future<employApi> getdata() async {
//     try {
//       Response response = await get(Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));
//       if (response.statusCode == 200) {
//         var body = employApi.fromJson(jsonDecode(response.body));
//         return body;
//       } else {
//         throw Exception("Failed to load data: ${response.statusCode}");
//       }
//     } catch (err) {
//       throw Exception("Failed to load data: $err");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<employApi>(
//         future: getdata(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.hasData) {
//             List<Data>? employees = snapshot.data!.data;
//             if (employees == null || employees.isEmpty) {
//               return Center(child: Text("No employees found"));
//             } else {
//               return ListView.builder(
//                 itemCount: employees.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(employees[index].employeeName?? ""),
//                   );
//                 },
//               );
//             }
//           } else {
//             return Center(child: Text("No data available"));
//           }
//         },
//       ),
//     );
//   }
// }
