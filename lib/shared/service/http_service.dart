import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task.dart';

//TODO dependency inversion
class HttpService {
  static const url = 'http://192.168.0.70:8080/tasks';

  HttpService();

  List<Task> parseTasks(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Task>((json) => Task.fromJson(json)).toList();
  }

  Future<List<Task>> fetchTasks(http.Client client) async {
    final response = await client.get(Uri.parse(url));
    return parseTasks(response.body);
  }
}
