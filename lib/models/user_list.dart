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

  void addUser(new_user) {
    _user_list.add(new_user);
  }

  updateUser(User new_user) async {
    for (int i = 0; i < _user_list.length; i++){
      if (new_user.id == _user_list[i].id){
        _user_list[i] = new_user;
      }
    }
  }

  remove(User user) async{
    _user_list.remove(user);
  }
}
