import 'package:flutter/material.dart';

class Repository extends StatelessWidget {
  const Repository({required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(id),
    );
  }
}
