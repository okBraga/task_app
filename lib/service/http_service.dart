import 'dart:convert';

import 'package:http/http.dart';

import '../model/task.dart';

class HttpService {
  String url;

  HttpService({
    required this.url,
  });

  Future<List<Task>> fetchTasks() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Task> tasks = body.map((dynamic item) => Task.fromJson(item)).toList();
      return tasks;
    } else {
      throw Exception('Failed to load Tasks');
    }
  }
}
