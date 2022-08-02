import 'package:flutter/material.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(id),
    );
  }
}
