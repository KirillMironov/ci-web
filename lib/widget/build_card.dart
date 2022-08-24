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
          (() {
            switch (_build.status) {
              case Status.success:
                return const Icon(Icons.check, color: Colors.green);
              case Status.failure:
                return const Icon(Icons.close, color: Colors.red);
              case Status.skipped:
                return const Icon(Icons.cancel_outlined, color: Colors.grey);
              default:
                return const Icon(Icons.settings, color: Colors.orangeAccent);
            }
          }()),
          const SizedBox(width: 10),
          Text(_build.commit.hash),
        ],
      ),
    );
  }
}
