import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<http.Response> getJokeTypesFromAPI() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    return response;
  }

  static Future<dynamic> getJokesByTypeAPI(String type) async {
    final response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load data!");
    }
  }

  static Future<Map<String, dynamic>> getRndomJokeAPI() async {
    final response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
