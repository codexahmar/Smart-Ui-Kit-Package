import 'package:flutter/material.dart';
import 'package:smart_ui/pages/smart_showcase_page.dart';

void main() {
  runApp(const SmartDemoApp());
}

class SmartDemoApp extends StatelessWidget {
  const SmartDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart UI Layouts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:  SmartShowcasePage(),
    );
  }
}
