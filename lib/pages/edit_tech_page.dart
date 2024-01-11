import 'package:flutter/material.dart';

import '../app_design.dart';
import '../models/tech.dart';

class EditTechPage extends StatelessWidget {
  EditTechPage({super.key});

  Tech? tech;

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController techStateController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  saveUpdateButtonClick(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Введите название!")));
      return;
    }
    if (tech == null) {
      String new_id =
          (int.parse(techList.getAllTechs().last.id) + 1).toString();
      Tech new_tech = Tech(
        id: new_id,
        name: nameController.text,
        category: categoryController.text,
        tech_state: techStateController.text,
        department: departmentController.text,
      );
      techList.addTech(new_tech);
    } else {
      Tech new_tech = Tech(
        id: tech!.id,
        name: nameController.text,
        category: categoryController.text,
        tech_state: techStateController.text,
        department: departmentController.text,
      );
      techList.updateTech(new_tech);
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
                  techList.remove(tech!);
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
    tech = ((ModalRoute.of(context)?.settings.arguments ?? <String, Tech>{})
        as Map)['tech'];
    if (initFlag) {
      if (tech != null) {
        nameController.text = tech!.name;
        categoryController.text = tech!.category;
        techStateController.text = tech!.tech_state;
        departmentController.text = tech!.department;
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
          "Техника",
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
                    labelText: "Название",
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
                child: DropdownMenu<String>(
                  controller: categoryController,
                  helperText: "Категория",
                  initialSelection: (tech == null)
                      ? categoryList.first
                      : categoryController.text,
                  dropdownMenuEntries:
                      categoryList.map<DropdownMenuEntry<String>>(
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
                child: DropdownMenu<String>(
                  controller: techStateController,
                  helperText: "Состояние",
                  initialSelection: (tech == null)
                      ? techStateList.first
                      : techStateController.text,
                  dropdownMenuEntries:
                      techStateList.map<DropdownMenuEntry<String>>(
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
                child: DropdownMenu<String>(
                  controller: departmentController,
                  helperText: "Отдел",
                  initialSelection: (tech == null)
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
                child: ElevatedButton(
                  onPressed: () {
                    saveUpdateButtonClick(context);
                  },
                  child: Text(
                    (tech == null) ? "Добавить" : "Сохранить",
                  ),
                ),
              ),
            ),
            (tech != null)
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
