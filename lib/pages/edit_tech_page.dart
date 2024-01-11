import 'package:flutter/material.dart';

import '../app_design.dart';

class EditTechPage extends StatelessWidget {
  const EditTechPage({super.key});

  List<DropdownMenuItem> categoryGenerate() {
    List<DropdownMenuItem> items = [];
    for (String i in categoryList) {
      items.add(
        DropdownMenuItem(
          value: Text(i),
          child: Text(i),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
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
                  helperText: "Категория",
                  initialSelection: categoryList.first,
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
                  helperText: "Состояние",
                  initialSelection: techStateList.first,
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
                  helperText: "Отдел",
                  initialSelection: departmentList.first,
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
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tech_list_page');
                    },
                    child: const Text(
                      "Добавить",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
