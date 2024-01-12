import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_design.dart';
import '../models/user.dart';

class UserList {
  List<User> _user_list = [];

  List<User> getAllUsers() {
    return _user_list;
  }

  List<User> findUser(String text) {
    List<User> new_users = [];
    for (User user in _user_list) {
      if (user.toString().toLowerCase().contains(text)) {
        new_users.add(user);
      }
    }
    return new_users;
  }

  GetFromServer() async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse("$url/users"));

      String body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> answer = jsonDecode(body);

      fromJson(answer['users']);
    } catch (e) {
      print("Ошибка запроса пользователей: $e");
    }
  }

  void addUser(new_user) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/add_user?id=${new_user.id}&name=${new_user.name}&surname=${new_user.surname}&email=${new_user.email}&password=${new_user.password}&department=${new_user.department}&isAdmin=${new_user.isAdmin}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка добавления пользователя: $e");
    }
  }

  updateUser(User new_user) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/update_user?id=${new_user.id}&name=${new_user.name}&surname=${new_user.surname}&email=${new_user.email}&password=${new_user.password}&department=${new_user.department}&isAdmin=${new_user.isAdmin}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка обновления пользователя: $e");
    }
  }

  remove(User user) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse("$url/remove_user?id=${user.id}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка удаления пользователя: $e");
    }
  }

  fromJson(List<dynamic> new_users) {
    _user_list.clear();
    for (dynamic new_user in new_users) {
      _user_list.add(
        User(
          id: new_user["id"].toString(),
          name: new_user["name"],
          surname: new_user["surname"],
          email: new_user["email"],
          password: new_user["password"],
          department: new_user["department"],
          isAdmin: new_user["isAdmin"],
        ),
      );
    }
  }
}
