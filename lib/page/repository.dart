import 'package:ci_web/widget/hover_box.dart';
import 'package:flutter/material.dart';

import '../domain/repository.dart';
import '../port/repositories.dart';
import '../widget/build_card.dart';

class RepositoryPage extends StatefulWidget {
  const RepositoryPage(this.id, this.repositoriesService);

  final String id;
  final RepositoriesService repositoriesService;

  static String routeName(String id) => '/repositories/$id';

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  late Future<Repository> _repository;

  @override
  void initState() {
    super.initState();
    _repository = widget.repositoriesService.getById(widget.id);
  }

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
            future: _repository,
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
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data?.builds?.length ?? 0,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) => HoverBox(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: BuildCard(snapshot.data!.builds![index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
