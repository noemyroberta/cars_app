import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {replacement = false}) {
  if (replacement) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}
