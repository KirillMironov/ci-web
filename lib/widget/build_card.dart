import 'package:flutter/material.dart';

import '../domain/build.dart';
import '../domain/status.dart';

class BuildCard extends StatelessWidget {
  const BuildCard(this._build);

  final Build _build;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      child: Row(
        children: [
          _build.status == Status.success.name
              ? const Icon(Icons.check, color: Colors.green)
              : const Icon(Icons.close, color: Colors.red),
          const SizedBox(width: 10),
          Text(_build.commit.hash),
        ],
      ),
    );
  }
}
