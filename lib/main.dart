import 'package:flutter/material.dart';
import './screens/homescreen.dart';

void main() {
  runApp(new UserScreenApp());
}

class UserScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "User Screen",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Tell us about yourself!"),
            ),
            body: Home()));
  }
}
