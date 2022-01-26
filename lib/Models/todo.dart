class Todo {
  String title;
  String category;

  Todo(this.title,this.category);

  //toObject
  Todo.fromMap(Map map)
      : title = map['title'] as String,
        category = map['category'] as String;

  //toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['category'] = category;
    return data;
  }
}