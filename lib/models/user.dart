class User {
  String id;
  String name;
  String surname;
  String email;
  String password;
  String department;
  String isAdmin;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.department,
    required this.isAdmin,
  });

  @override
  String toString() {
    return "$id $name $surname $email $department";
  }
}