import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  bool obscureText;

  AppText(
      {this.label,
      this.hint,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
        hintText: hint,
      ),
      obscureText: obscureText,
    );
  }
}
