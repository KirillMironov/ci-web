import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:flutter/material.dart';

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
            tooltip: 'Add repository',
            onPressed: () => Navigator.pushNamed(context, '/add'),
          ),
        ],
      ),
      body: FutureBuilder<List<Repository>>(
        future: widget.repositoriesService.getAll(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, index) {
                final repository = snapshot.data![index];
                return ListTile(
                  title: Text(repository.url),
                  subtitle: Text(repository.latestCommit),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
