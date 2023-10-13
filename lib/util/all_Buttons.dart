import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButtons extends StatelessWidget {
  final String butName;
  VoidCallback onPressed;
  MyButtons({
    super.key,
    required this.butName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey,
      child: Text(butName),
    );
  }
}
