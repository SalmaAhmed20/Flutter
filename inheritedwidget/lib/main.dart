import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inheritedwidget/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: const Text('Inherited Widget')),
            backgroundColor: Colors.teal,
          ),
          body: MyHome(),
        )
    );
  }
}
