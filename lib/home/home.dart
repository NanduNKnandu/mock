import 'package:flutter/material.dart';

class homee extends StatefulWidget {
  const homee({super.key});

  @override
  State<homee> createState() => _homeeState();
}

class _homeeState extends State<homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("home")),
    );
  }
}
