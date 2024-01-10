import '../models/tech.dart';

class TechList {
  List<Tech> _tech_list = [];

  void addTech(new_tech){
    _tech_list.add(new_tech);
  }

  List<Tech> getAllTechs(){
    return _tech_list;
  }
  List<Tech> findTech(String text){
    List<Tech> new_techs = [];
    for(Tech tech in _tech_list){
      if (tech.toString().contains(text)){
        new_techs.add(tech);
      }
    }
    return new_techs;
  }
}