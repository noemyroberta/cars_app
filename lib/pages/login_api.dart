import 'dart:convert';
import 'package:cars/pages/Users.dart';
import 'package:cars/pages/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Users>> login(
      String username, String password) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map params = {
      "username": username,
      "password": password,
    };

    String strJson = json.encode(params);

    var response = await http.post(url, body: strJson, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final user = Users.fromJson(mapResponse);

      return ApiResponse.alright(user);
    }

    return ApiResponse.error(mapResponse['error']);
  }
}
