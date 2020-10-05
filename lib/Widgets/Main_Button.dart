import 'package:flutter/material.dart';
import 'package:jobby/constants.dart';

class MainActionButton extends StatelessWidget {
  MainActionButton({
    this.onPressed,
    this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 5,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: darkGrey,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.3,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
