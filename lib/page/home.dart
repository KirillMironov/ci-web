import 'package:ci_web/port/repositories.dart';
import 'package:flutter/material.dart';

import 'add_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.repositoriesService);

  final RepositoriesService repositoriesService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'add repository',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddRepository(widget.repositoriesService),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
