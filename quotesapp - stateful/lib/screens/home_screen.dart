import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "";
  String userId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(title, style: const TextStyle(fontSize: 20)),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text("- UserId: $userId",
                        style: const TextStyle(fontSize: 18))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      var url = Uri.parse(
                          'https://jsonplaceholder.typicode.com/albums/1');
                      var response = await http.get(url);
                      print('Response Status: ${response.statusCode}');
                      print('Response Body: ${response.body}');
                      var data = jsonDecode(response.body);
                      userId = data["userId"].toString();
                      title = data["title"];
                      setState(() {});
                    },
                    child: const Text("Get quote!")),
              ],
            )));
  }
}
