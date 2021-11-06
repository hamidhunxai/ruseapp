import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.title, required this.colour, required this.onPressed});
  final String title;
  final Color colour;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colour,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 400.0,
        height: 42.0,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
