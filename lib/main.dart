import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlinestore/login.dart';
import 'package:onlinestore/pages/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/dashboard',
    routes: {
      '/': (context) => Home(),
      '/dashboard': (context) => Dashboard(),
      // '/': (context)=> Home(),
    },
  ));
}
