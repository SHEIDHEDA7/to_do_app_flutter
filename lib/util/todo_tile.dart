// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart'; 
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool done;

  final Function(bool?)? onChanged;

  final Function(BuildContext)? deleteFunc;
  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.done,
      required this.onChanged,
      required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      // padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade200,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //Check Box
              Checkbox(
                value: done,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //Task name
              Text(taskName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    //  for line through of text, when done
                    // decoration:
                    //     done ? TextDecoration.lineThrough : TextDecoration.none,
                  )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.grey[500], borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
