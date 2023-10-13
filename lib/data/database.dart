// ignore_for_file: unused_field

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //Reference box
  final _mybox = Hive.box('mybox');

  //Run the method if this is the first time opening the app
  void createInitialData() {
    toDoList = [
      ["Read Qur'an", true],
      ["Go Gym", false],
    ];
    // toDoList.add(value);
  }

  //Loading the data from DB
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //Update the DB
  void updateData() {
    _mybox.put("TODOLOST", toDoList);
  }
}
