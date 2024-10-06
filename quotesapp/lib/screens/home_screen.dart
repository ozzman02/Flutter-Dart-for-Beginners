import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotesapp/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      /*var url = Uri.parse(
                          'https://goquotes-api.herokuapp.com/api/v1/random?count=1');*/

                      var url = Uri.parse(
                          'https://jsonplaceholder.typicode.com/albums/1');
                      var response = await http.get(url);
                      print('Response Status: ${response.statusCode}');
                      print('Response Body: ${response.body}');
                      var data = jsonDecode(response.body);
                      //print(data["userId"]);
                      //print(data["id"]);
                      //print(data["title"]);
                      String userId = data["userId"].toString();
                      String title = data["title"];

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SecondScreen(userId: userId, title: title)));
                    },
                    child: const Text("Get quote!")))));
  }
}
