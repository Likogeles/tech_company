import 'package:flutter/material.dart';
import 'package:tech_company/models/tech_list.dart';

import '../models/tech.dart';

class TechListPage extends StatefulWidget {
  const TechListPage({super.key});

  @override
  State<TechListPage> createState() => _TechListPageState();
}

class _TechListPageState extends State<TechListPage> {
  TechList techList = TechList();
  List<Tech> toShowTechList = [];

  textFieldUpdate(String text) {
    print(123);
    toShowTechList = techList.findTech(text);
    setState(() {});
  }

  @override
  void initState() {
    techList.addTech(Tech(
        id: "1AB12",
        name: "Tech_1",
        department: "department_1",
        tech_state: "tech_state_1",
        category: "category_1"));
    techList.addTech(Tech(
        id: "1AB13",
        name: "Tech_2",
        department: "department_2",
        tech_state: "tech_state_2",
        category: "category_2"));
    techList.addTech(Tech(
        id: "1AB14",
        name: "Tech_3",
        department: "department_3",
        tech_state: "tech_state_3",
        category: "category_3"));
    techList.addTech(Tech(
        id: "1AB15",
        name: "Tech_3",
        department: "department_3",
        tech_state: "tech_state_3",
        category: "category_3"));
    techList.addTech(Tech(
        id: "1AB16",
        name: "Tech_5",
        department: "department_5",
        tech_state: "tech_state_5",
        category: "category_5"));

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
        title: const Text(
          "Список техники",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: (toShowTechList.isNotEmpty)
                ? ListView.builder(
                    itemCount: toShowTechList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TechCard(context, toShowTechList[index]);
                    },
                  )
                : const Text("Нет совпадений"),
          ),
        ],
      ),
    );
  }

  Widget TechCard(BuildContext context, Tech tech) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 115,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: Row(
            children: [
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
                  print(tech.id);
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
