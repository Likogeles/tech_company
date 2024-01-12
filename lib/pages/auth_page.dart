import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_design.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;

  Future<bool> authCheck(BuildContext context) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/login?email=${emailController.text}&password=${passwordController.text}"));
      String body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> answer = jsonDecode(body);
      if (answer.containsKey("isAdmin")) {
        user_is_admin = (answer['isAdmin'] == '1');
        return true;
      }
    } catch (e) {
      print("Ошибка входа: $e");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 5),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Почта",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {},
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 5),
                child: TextField(
                  obscureText: passwordVisible,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Пароль",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                  onChanged: (text) {},
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 5),
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Поля не заполнены")));
                      return;
                    }
                    if (!(await authCheck(context))) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Почта или пароль введены неверно")));
                    } else {
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  child: const Text("Войти"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
