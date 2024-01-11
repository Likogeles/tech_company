import 'package:flutter/material.dart';

import '../app_design.dart';
import '../models/tech_list.dart';
import '../models/tech.dart';

class TechListPage extends StatefulWidget {
  const TechListPage({super.key});

  @override
  State<TechListPage> createState() => _TechListPageState();
}

bool initFlag = true;

class _TechListPageState extends State<TechListPage> {
  List<Tech> toShowTechList = [];
  techListUpdate() {
    if (initFlag) {
      techList.addTech(Tech(
          id: "1",
          name: "Принтер",
          department: "Охрана",
          tech_state: "Работает",
          category: "Общее"));
      techList.addTech(Tech(
          id: "2",
          name: "Компьютер 1",
          department: "Отдел продаж",
          tech_state: "Работает",
          category: "Личное"));
      techList.addTech(Tech(
          id: "3",
          name: "Ксерокс",
          department: "Отдел кадров",
          tech_state: "Требуется ремонт",
          category: "Общее"));
      techList.addTech(Tech(
          id: "4",
          name: "Куллер",
          department: "Отдел продаж",
          tech_state: "В ремонте",
          category: "Общее"));
      techList.addTech(Tech(
          id: "5",
          name: "Кофемашина",
          department: "Технический отдел",
          tech_state: "Неисправно",
          category: "Общее"));
      initFlag = false;
    }
  }

  textFieldUpdate(String text) {
    toShowTechList = techList.findTech(text);
    setState(() {});
  }

  @override
  void initState() {
    techListUpdate();
    toShowTechList = techList.getAllTechs();
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
              Navigator.pushNamed(context, '/edit_tech_page');
            },
          ),
        ],
        title: const Text(
          "Список техники",
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
          SizedBox(
            child: (toShowTechList.isNotEmpty)
                ? Text("${toShowTechList.length} результатов")
                : const Text("Нет совпадений"),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: toShowTechList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TechCard(context, toShowTechList[index]);
                },
              )),
        ],
      ),
    );
  }

  Widget TechCard(BuildContext context, Tech tech) {
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
                    "Название: ",
                  ),
                  Text(
                    "Состояние: ",
                  ),
                  Text(
                    "Категория: ",
                  ),
                  Text(
                    "Отдел: ",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tech.id,
                  ),
                  Text(
                    tech.name,
                  ),
                  Text(
                    tech.tech_state,
                  ),
                  Text(
                    tech.category,
                  ),
                  Text(
                    tech.department,
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/edit_tech_page',
                    arguments: {'tech': tech},
                  );
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
