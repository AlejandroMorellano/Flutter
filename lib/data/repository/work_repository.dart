import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/work_model.dart';

class WorkRepository {
  final String apiUrl;
  final String accessToken;

  WorkRepository({required this.apiUrl, required this.accessToken});

  Future<void> createWork(WorkModel work) async {
    final response = await http.post(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(work.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create work');
    }
  }

  Future<WorkModel> getWork(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/works/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return WorkModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load work');
    }
  }

  Future<void> updateWork(WorkModel work) async {
    final response = await http.put(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(work.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update work');
    }
  }

  Future<void> deleteWork(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/works/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete work');
    }
  }

  Future<List<WorkModel>> getAllWorks() async {
    final response = await http.get(
      Uri.parse('$apiUrl/works'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<WorkModel>.from(l.map((model) => WorkModel.fromJson(model)));
    } else {
      throw Exception('Failed to load works');
    }
  }
}
