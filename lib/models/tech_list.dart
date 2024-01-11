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
      if (tech.toString().toLowerCase().contains(text)){
        new_techs.add(tech);
      }
    }
    return new_techs;
  }

  updateTech(Tech new_tech){
    for (int i = 0; i < _tech_list.length; i++) {
      if (_tech_list[i].id == new_tech.id){
        _tech_list[i] = new_tech;
      }
    }
  }
  remove(Tech tech){
    _tech_list.remove(tech);
  }
}