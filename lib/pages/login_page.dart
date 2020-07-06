import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _focusInputPassword = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textFormField(
              'Username',
              'Type the username',
              controller: _controllerUsername,
              validator: _validateUsername,
              textInputAction: TextInputAction.next,
              nextFocus: _focusInputPassword,
            ),
            SizedBox(
              height: 15,
            ),
            _textFormField(
              'Password',
              'Type the password',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              focusNode: _focusInputPassword,
            ),
            SizedBox(
              height: 20,
            ),
            _button('OK', _onClickController),
          ],
        ),
      ),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => onPressed,
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    obscureText = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(_focusInputPassword);
        }
      },
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
      decoration: InputDecoration(
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

  void _onClickController() {
    bool _formIsOk = _formKey.currentState.validate();

    if (!_formIsOk) return;

    String username = _controllerUsername.text;
    String password = _controllerPassword.text;

    print("Username: $username; Password: $password");
  }

  _validateUsername(String text) {
    if (text.isEmpty)
      return "Type a username";
    else
      return null;
  }

  _validatePassword(String text) {
    if (text.length <= 5)
      return "Please, type a password bigger than 5 characters";
    else
      return null;
  }
}
