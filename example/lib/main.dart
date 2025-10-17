import 'package:example/page/smart_showcase_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart UI Kit Example",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: SmartShowcasePage(),
    );
  }
}
