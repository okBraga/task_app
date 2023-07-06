import 'package:flutter/material.dart';
import 'package:task_app/widgets/slider_widget.dart';

import '../model/task.dart';
import '../service/http_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HttpService httpService = HttpService(url: 'https://5fd6-2804-14d-be85-8d50-a835-becd-dba0-74fa.sa.ngrok.io/tasks');

  static const _appBarTitle = 'My Tasks';
  static const _addButtonIcon = Icons.add;
  static const _searchButtonIcon = Icons.search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              // Perform search action
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: httpService.fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              List<Task>? tasks = snapshot.data;
              return ListView.separated(
                itemCount: tasks!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/task'),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListTile(
                              title: Text(
                                tasks[index].title,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              subtitle: Text(
                                tasks[index].title,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              //Todo see how to calculate how many subtasks are completed
                              child: Align(alignment: Alignment.centerRight, child: Text('5 of 10 Tasks')),
                            ),
                            const SliderWidget(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
