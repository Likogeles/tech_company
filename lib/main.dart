import 'package:flutter/material.dart';
import '../pages/main_page.dart';
import '../pages/tech_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechCompany',
      routes: {
        '/': (context) => MainPage(),
        '/tech_list_page': (context) => TechListPage(),
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
