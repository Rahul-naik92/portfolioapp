import 'package:flutter/material.dart';
import 'package:portfolioapp/about.dart';
import 'package:portfolioapp/home.dart';
import 'package:portfolioapp/project.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Soho'),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/project': (context) => MyProject(),
        '/': (context) => Home(),
        '/about': (context) => MyAbout(),
      },
    ),
  );
}
