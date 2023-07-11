import 'package:flutter/material.dart';
import 'package:task_app/shared/components/slider_widget.dart';

class TaskWidget extends StatelessWidget {
  final Color? taskColor;
  final Widget title;
  final Widget description;

  const TaskWidget({super.key, this.taskColor, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: taskColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/task'),
        child: ListTile(
          title: title,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              description,
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                //TODO calculate how many subtasks are completed
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '5 of 10 tasks',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    )),
              ),
              const SizedBox(height: 8),
              const SliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
