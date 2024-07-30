import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/work_model.dart';

class workRepository {
  final String apiUrl;
  final String accessToken;

  workRepository({required this.apiUrl, required this.accessToken});

  Future<void> createWork(UserModel user) async {
    final response = await http.post(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(user.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create user');
    }
  }

  Future<UserModel> getWork(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/works/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/works/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }

  Future<List<UserModel>> getAllworks() async {
    final response = await http.get(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<UserModel>.from(l.map((model) => UserModel.fromJson(model)));
    } else {
      throw Exception('Failed to load works');
    }
  }
}
