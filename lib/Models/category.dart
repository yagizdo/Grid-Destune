class Category {
  String title;

  Category(this.title);


  //toObject
  Category.fromMap(Map map)
      : title = map['title'] as String;

  //toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}