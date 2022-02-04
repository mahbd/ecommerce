class Category {
  final String name;

  const Category({
    required this.name,
  });

  // from json
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
