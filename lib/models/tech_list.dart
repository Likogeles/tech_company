import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_design.dart';
import '../models/tech.dart';

class TechList {
  List<Tech> _tech_list = [];

  List<Tech> getAllTechs() {
    return _tech_list;
  }

  List<Tech> findTech(String text) {
    List<Tech> new_techs = [];
    for (Tech tech in _tech_list) {
      if (tech.toString().toLowerCase().contains(text)) {
        new_techs.add(tech);
      }
    }
    return new_techs;
  }

  GetFromServer() async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse("$url/techs"));

      String body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> answer = jsonDecode(body);

      fromJson(answer['techs']);
    } catch (e) {
      print("Ошибка запроса техники: $e");
    }
  }

  void addTech(new_tech) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/add_tech?id=${new_tech.id}&name=${new_tech.name}&category=${new_tech.category}&tech_state=${new_tech.tech_state}&department=${new_tech.department}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка добавления техники: $e");
    }
  }

  updateTech(Tech new_tech) async {
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/update_tech?id=${new_tech.id}&name=${new_tech.name}&category=${new_tech.category}&tech_state=${new_tech.tech_state}&department=${new_tech.department}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка обновления техники: $e");
    }
  }

  remove(Tech tech) async{
    http.Response response = http.Response('', 404);
    try {
      response = await http.get(Uri.parse(
          "$url/remove_tech?id=${tech.id}"));

      String body = utf8.decode(response.bodyBytes);
      print(body);
    } catch (e) {
      print("Ошибка обновления техники: $e");
    }
  }

  fromJson(List<dynamic> new_techs) {
    _tech_list.clear();
    for (dynamic new_tech in new_techs) {
      _tech_list.add(
        Tech(
          id: new_tech["id"].toString(),
          name: new_tech["name"],
          category: new_tech["category"],
          tech_state: new_tech["tech_state"],
          department: new_tech["department"],
        ),
      );
    }
  }
}
