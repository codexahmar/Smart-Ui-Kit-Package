import 'package:example/page/smart_showcase_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_ui_kit/widgets/smart_splashscreen.dart';

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
      darkTheme: ThemeData.light(),
      home: SmartSplash(
        image: Image.asset("assets/images/splash.jpg"),
        duration: 3,
        nextScreen: const SmartShowcasePage(),
      ),
    );
  }
}
