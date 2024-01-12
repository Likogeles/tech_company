import 'package:flutter/material.dart';

import '../app_design.dart';
import '../models/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

bool initFlag = true;

class _UserListPageState extends State<UserListPage> {
  List<User> toShowUserList = [];

  bool updatingFlag = false;

  textFieldUpdate(String text) {
    toShowUserList = userList.findUser(text);
    setState(() {});
  }

  editUserPagePush(BuildContext context) async {
    await Navigator.pushNamed(context, '/edit_user_page');
    setState(() {});
  }

  editUserPageUpdatePush(BuildContext context, User user) async {
    await Navigator.pushNamed(
      context,
      '/edit_user_page',
      arguments: {'user': user},
    );
    setState(() {});
  }

  @override
  void initState() {
    userList.addUser(User(
        id: "1",
        name: "Иван",
        surname: "Сидоров",
        email: "ivan@ya.ru",
        password: "qwerty1234",
        department: "Охрана",
        isAdmin: "1"));
    userList.addUser(User(
        id: "2",
        name: "Федор",
        surname: "Иванов",
        email: "fedor@ya.ru",
        password: "qwerty1234",
        department: "Отдел продаж",
        isAdmin: "1"));
    userList.addUser(User(
        id: "3",
        name: "Сергей",
        surname: "Петров",
        email: "sergey@ya.ru",
        password: "qwerty1234",
        department: "Технический отдел",
        isAdmin: "0"));
    userList.addUser(User(
        id: "4",
        name: "Петр",
        surname: "Сергеев",
        email: "petr@ya.ru",
        password: "qwerty1234",
        department: "Отдел кадров",
        isAdmin: "0"));
    userList.addUser(User(
        id: "5",
        name: "Владимир",
        surname: "Маяковский",
        email: "vladimir@ya.ru",
        password: "qwerty1234",
        department: "Охрана",
        isAdmin: "0"));
    toShowUserList = userList.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              editUserPagePush(context);
            },
          ),
        ],
        title: const Text(
          "Сотрудники",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Поиск...',
                ),
                onChanged: (text) {
                  textFieldUpdate(text);
                },
              ),
            ),
          ),
          (updatingFlag)
              ? Container()
              : SizedBox(
                  child: (toShowUserList.isNotEmpty)
                      ? Text("${toShowUserList.length} результатов")
                      : const Text("Нет совпадений"),
                ),
          (updatingFlag)
              ? const CircularProgressIndicator()
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    itemCount: toShowUserList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(context, toShowUserList[index]);
                    },
                  )),
        ],
      ),
    );
  }

  Widget UserCard(BuildContext context, User user) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 115,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID: ",
                  ),
                  Text(
                    "ФИ: ",
                  ),
                  Text(
                    "Email: ",
                  ),
                  Text(
                    "Отдел: ",
                  ),
                  Text(
                    "Роль: ",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.id,
                  ),
                  Text(
                    "${user.name} ${user.surname}",
                  ),
                  Text(
                    user.email,
                  ),
                  Text(
                    user.department,
                  ),
                  Text(
                    (user.isAdmin == "1") ? "Администратор" : "Пользователь",
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  editUserPageUpdatePush(context, user);
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
