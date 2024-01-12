import 'package:flutter/material.dart';

import '../app_design.dart';
import '../models/user.dart';

class EditUserPage extends StatefulWidget {
  EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  User? user;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  bool isAdminController = false;

  bool passwordVisible = true;

  saveUpdateButtonClick(BuildContext context) {
    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        departmentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Не все поля заполнены!")));
      return;
    }
    if (user == null) {
      String new_id =
          (int.parse(userList.getAllUsers().last.id) + 1).toString();
      User new_user = User(
        id: new_id,
        name: nameController.text,
        surname: surnameController.text,
        email: emailController.text,
        password: passwordController.text,
        department: departmentController.text,
        isAdmin: isAdminController ? "1" : "0",
      );
      userList.addUser(new_user);
    } else {
      User new_user = User(
        id: user!.id,
        name: nameController.text,
        surname: surnameController.text,
        email: emailController.text,
        password: passwordController.text,
        department: departmentController.text,
        isAdmin: isAdminController ? "1" : "0",
      );
      userList.updateUser(new_user);
    }
    Navigator.of(context).pop();
  }

  deleteButtonClick(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Внимание"),
          content: const Text("Удалённый объект нельзя будет вернуть!"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Отмена")),
            TextButton(
                onPressed: () {
                  userList.remove(user!);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text("Продолжить")),
          ],
        );
        ;
      },
    );
  }

  bool initFlag = true;

  @override
  Widget build(BuildContext context) {
    user = ((ModalRoute.of(context)?.settings.arguments ?? <String, User>{})
        as Map)['user'];
    if (initFlag) {
      if (user != null) {
        nameController.text = user!.name;
        surnameController.text = user!.surname;
        emailController.text = user!.email;
        passwordController.text = user!.password;
        departmentController.text = user!.department;
        isAdminController = (user!.isAdmin == "1");
      }
      initFlag = false;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Сотрудник",
          style: TextStyle(fontSize: 30),
        ),
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Имя",
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
                  controller: surnameController,
                  decoration: const InputDecoration(
                    labelText: "Фамилия",
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
                child: DropdownMenu<String>(
                  controller: departmentController,
                  helperText: "Отдел",
                  initialSelection: (user == null)
                      ? departmentList.first
                      : departmentController.text,
                  dropdownMenuEntries:
                      departmentList.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: isAdminController,
                      onChanged: (bool value) {
                        setState(() {
                          isAdminController = value;
                        });
                        print(isAdminController);
                      },
                    ),
                    const Text("Администратор")
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    saveUpdateButtonClick(context);
                  },
                  child: Text(
                    (user == null) ? "Добавить" : "Сохранить",
                  ),
                ),
              ),
            ),
            (user != null)
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          deleteButtonClick(context);
                        },
                        child: const Text("Удалить"),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
