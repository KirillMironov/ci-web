import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/page/add_repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:flutter/material.dart';

import '../widget/repository_card.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.repositoriesService);

  final RepositoriesService repositoriesService;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add repository',
            onPressed: () =>
                Navigator.pushNamed(context, AddRepositoryPage.routeName),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 1500,
          child: FutureBuilder<List<Repository>>(
            future: repositoriesService.getAll(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Add a repository \u2197'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data?.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      RepositoryCard(repository: snapshot.data![index]),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
