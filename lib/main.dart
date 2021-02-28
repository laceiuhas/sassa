import 'package:flutter/material.dart';
import './screens/login_id.dart';
// import './screens/login_otp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: LoginScreen(),
    );
  }
}
