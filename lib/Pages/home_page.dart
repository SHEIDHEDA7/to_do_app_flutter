// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';
// import 'package:flutter/material.dart’;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Instance of the class is created
ToDoDataBase db = ToDoDataBase();

//list of to do tasks
// List todoList = [
//   ["Read Qur'an", true],
//   ["Go Gym", false],
// ];
// Instead will be used in database.dart

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Check box was tapped
    void checkBoxChanged(bool? value, int index) {
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateData();
    }

    //Reference the box
    final _mybox = Hive.box('Mybox');

    //For loading the operations
    @override
    void initState() {
      //Opening First time
      if (_mybox.get("TODOLIST") == null) {
        db.createInitialData();
      } else {
        db.loadData();
      }

      super.initState();
    }

    //text controller
    final _controller = TextEditingController();

    //save new Task
    void saveTask()
    //We want to add the info to the list
    {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop(); //Dismiss the box
      db.updateData();
    }

    //create a new task
    void createNewTask() {
      //Creates a dialog box so that user can enter the details of the tasks
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(), //Cancels
          );
        },
      );
    }

    //Delete the task

    void deleteTask(int index) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateData();
    }

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("TO DO", style: TextStyle(fontSize: 20)),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          size: 50,
        ),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              done: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunc: (context) => deleteTask(index),
            );
          }),
    );
  }
}
