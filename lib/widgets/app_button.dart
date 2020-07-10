import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  bool circularProgress;

  AppButton(
    this.text,
    this.onPressed, {
    this.color = Colors.blue,
    this.circularProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: color,
        child: circularProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
