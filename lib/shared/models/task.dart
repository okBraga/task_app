import 'package:task_app/shared/models/sub_task.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  //final String status;
  //final SubTask subtask;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    //required this.status,
    //required this.subtask,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      //status: json['status'],
      //subtask: SubTask.fromJson(json['subtask'] as Map<String, dynamic>),
    );
  }
}
