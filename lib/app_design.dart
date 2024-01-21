import '../models/user_list.dart';

import '../models/tech_list.dart';

TechList techList = TechList();
UserList userList = UserList();

bool user_is_admin = false;


const List<String> categoryList = ["Общее", "Личное"];
const List<String> techStateList = ["Работает", "Требуется ремонт", "В ремонте", "Неисправно"];
const List<String> departmentList = ["Отдел кадров", "Охрана", "Отдел продаж", "Технический отдел"];

// const String url = "http://176.57.218.12:5000";
const String url = "http://10.0.2.2:5000";
