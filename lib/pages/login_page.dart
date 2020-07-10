import 'package:cars/pages/api_response.dart';
import 'package:cars/pages/login_api.dart';
import 'package:cars/pages/login_home.dart';
import 'package:cars/pages/utils/alert.dart';
import 'package:cars/pages/utils/navigation.dart';
import 'package:cars/widgets/app_button.dart';
import 'package:cars/widgets/app_text.dart';
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
  bool _showCircularProgress = false;

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
            AppText(
              label: 'Username',
              hint: 'Type the username',
              controller: _controllerUsername,
              validator: _validateUsername,
              textInputAction: TextInputAction.next,
              nextFocus: _focusInputPassword,
            ),
            SizedBox(
              height: 15,
            ),
            AppText(
              label: 'Password',
              hint: 'Type the password',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              focusNode: _focusInputPassword,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              'OK',
              _onClickController,
              circularProgress: _showCircularProgress,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickController() async {
    bool _formIsOk = _formKey.currentState.validate();

    if (!_formIsOk) {
      return;
    }

    String username = _controllerUsername.text;
    String password = _controllerPassword.text;

    setState(() {
      _showCircularProgress = true;
    });

    ApiResponse response = await LoginApi.login(username, password);

    if (response.status) {
      push(context, LoginHome(), replacement: true);
      print("Username: $username; Password: $password");
    } else {
      alert(context, response.message);
    }

    setState(() {
      _showCircularProgress = false;
    });
  }

  String _validateUsername(String text) {
    if (text.isEmpty) {
      return "Type a username";
    }
    return null;
  }

  String _validatePassword(String text) {
    if (text.length < 3) {
      return "Please, type a password bigger than 3 characters";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
