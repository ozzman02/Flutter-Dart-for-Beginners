import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String userId;
  String title;

  SecondScreen({super.key, required this.userId, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(title, style: const TextStyle(fontSize: 20)),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text("- UserId: $userId",
                      style: const TextStyle(fontSize: 18)))
            ])));
  }
}
