import 'package:flutter/material.dart';
import 'package:task_app/widgets/check_list.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ))
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Task Title',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Description of Morbi in sem quis dui placerat ornare. Pellentesque odio nisi euismod in. Sed arcu.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'CheckList',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 5, // replace with the number of items you want to display
              separatorBuilder: (context, index) => const SizedBox(
                height: 4,
              ),
              itemBuilder: (context, index) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(child: CheckList()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
