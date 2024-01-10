class Tech {
  String id;
  String name;
  String department;
  String tech_state;
  String category;

  Tech({
    required this.id,
    required this.name,
    required this.department,
    required this.tech_state,
    required this.category,
  });

  @override
  String toString() {
    return "$id $name $department $tech_state $category";
  }
}