class Todo {
  Todo({required this.title, required this.datetime});
  String title;
  DateTime datetime;

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        datetime = DateTime.parse(json['dateTime']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': datetime.toIso8601String(),
    };
  }
}
