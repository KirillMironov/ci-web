import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/page/add_repository.dart';
import 'package:ci_web/page/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:ci_web/widget/hover_box.dart';
import 'package:flutter/material.dart';

import '../widget/repository_card.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.repositoriesService);

  final RepositoriesService repositoriesService;

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Repository>> _repositories;

  @override
  void initState() {
    super.initState();
    _repositories = widget.repositoriesService.getAll();
  }

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
            future: _repositories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Add a repository \u2197'));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) => HoverBox(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RepositoryPage.routeName(snapshot.data![index].id),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  child: RepositoryCard(snapshot.data![index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
