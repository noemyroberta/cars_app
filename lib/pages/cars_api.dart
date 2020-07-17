import 'package:cars/pages/Cars.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarsApi {
  static Future<List<Cars>> getCars() async {
    var url = "https://carros-springboot.herokuapp.com/api/v1/carros";

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);
    final cars = list.map<Cars>((map) => Cars.fromJson(map)).toList();

    return cars;
  }
}
