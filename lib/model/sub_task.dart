class SubTask {
  final int id;
  final String title;
  final bool isFinished;

  SubTask({
    required this.id,
    required this.title,
    required this.isFinished,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      id: json['id'],
      title: json['title'],
      isFinished: json['isFinished'],
    );
  }
}
