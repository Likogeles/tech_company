import 'package:flutter/material.dart';
import 'package:tech_company/pages/auth_page.dart';
import 'package:tech_company/pages/edit_tech_page.dart';
import '../pages/main_page.dart';
import '../pages/tech_list_page.dart';
import 'pages/edit_user_page.dart';
import 'pages/user_list_page.dart';

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
      initialRoute: "auth_page",
      routes: {
        'auth_page': (context) => AuthPage(),
        '/': (context) => const MainPage(),
        '/tech_list_page': (context) => TechListPage(),
        '/edit_tech_page': (context) => EditTechPage(),
        '/user_list_page': (context) => UserListPage(),
        '/edit_user_page': (context) => EditUserPage(),
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
