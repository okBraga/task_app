import 'package:task_app/model/sub_task.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final String status;
  //final SubTask subtask;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    //required this.subtask,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      status: json['status'],
      //subtask: SubTask.fromJson(json['subtask'] as Map<String, dynamic>),
    );
  }
}
