import 'package:flutter/material.dart';
import 'package:security_app/pages/adminlogin.dart';

void main() {
  runApp(const SecurityApp());
}

class SecurityApp extends StatelessWidget {
  const SecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminLogin(),
    );
  }
}

