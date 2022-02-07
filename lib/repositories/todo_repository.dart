import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

const todoListKey = 'todo_list';

class TodoRepository {
  Future<List<Todo>> getTodoList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) async {
    final String jsonString = json.encode(todos);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final save = sharedPreferences.setString(todoListKey, jsonString);
  }
}
