import 'package:flutter/material.dart';
import 'package:task_app/shared/components/task_widget.dart';
import 'package:task_app/shared/service/http_service.dart';

import 'package:http/http.dart' as http;

import '../shared/models/task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _appBarTitle = 'My Tasks';
  static const _addButtonIcon = Icons.add;
  static const _searchButtonIcon = Icons.search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        title: const Text(
          _appBarTitle,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(
              _searchButtonIcon,
              color: Colors.white,
            ),
            onPressed: () {
              //TODO Perform search action
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Task>>(
        future: HttpService().fetchTasks(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Center(child: Text('An error has occurred!')),
            );
          } else if (snapshot.hasData) {
            return TaskList(tasks: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        surfaceTintColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(_addButtonIcon, color: Colors.black),
              onPressed: () {},
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TaskWidget(
            title: Text(
              tasks[index].title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            description: Text(
              tasks[index].description,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            taskColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
