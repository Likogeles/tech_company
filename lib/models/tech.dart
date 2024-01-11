class Tech {
  String id;
  String name;
  String category;
  String tech_state;
  String department;

  Tech({
    required this.id,
    required this.name,
    required this.category,
    required this.tech_state,
    required this.department,
  });

  @override
  String toString() {
    return "$id $name $category $tech_state $department";
  }
}