import 'package:flutter/material.dart';

import '../app_design.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Техника компании",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tech_list_page');
              },
              child: const Text(
                "Техника",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            (user_is_admin)
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/user_list_page');
                    },
                    child: const Text(
                      "Сотрудники",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
