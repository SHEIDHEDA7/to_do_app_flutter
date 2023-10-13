import 'package:flutter/material.dart';
import 'package:to_do_app/util/all_Buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Take User Input
            TextField(
              controller: controller,
              //To access the input given by the user controller is used
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Add new Task",
              ),
            ),

            //Buttons for saving and cancelling
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                MyButtons(butName: "Save", onPressed: onSave),

                const SizedBox(
                  width: 10,
                ),

                //Cancel Button
                MyButtons(butName: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
