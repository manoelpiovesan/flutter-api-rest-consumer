import 'dart:convert';

import 'package:http/http.dart' as http;

class UserController {
  String url = 'http://localhost:3000/user';

  ///
  ///
  ///
  Future<List<Map<String, dynamic>>> read() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }

  ///
  ///
  ///
  Future<bool> create(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(url), body: json.encode(data));
    print(json.encode(data));

    if (response.statusCode == 201) {
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load data');
    }
  }

  ///
  ///
  ///
  Future<bool> delete(String id) async {
    final response = await http.delete(Uri.parse('$url/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  ///
  ///
  ///
  Future<List<Map<String, dynamic>>> update(
      String id, Map<String, dynamic> data) async {
    final response = await http.put(Uri.parse('$url/$id'), body: data);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
