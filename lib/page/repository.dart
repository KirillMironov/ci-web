import 'package:flutter/material.dart';

import '../domain/repository.dart';
import '../port/repositories.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage(this.id, this.repositoriesService);

  final String id;
  final RepositoriesService repositoriesService;

  static String routeName(String id) => '/repositories/$id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository'),
      ),
      body: Center(
        child: SizedBox(
          width: 1500,
          child: FutureBuilder<Repository>(
            future: repositoriesService.getById(id),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('Not found'));
              }
              return Column(
                children: [
                  Text(snapshot.data!.id),
                  Text(snapshot.data!.url),
                  Text(snapshot.data!.branch),
                  Text(snapshot.data!.latestCommit.toString()),
                  Text(snapshot.data!.pollingInterval.toString()),
                  Text(snapshot.data!.builds?.toString() ?? ''),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
