import 'package:ci_web/domain/commit.dart';

class Build {
  final String id;
  final Commit commit;
  final String status;
  final DateTime createdAt;

  Build.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        commit = Commit.fromJson(json['commit']),
        status = json['status'],
        createdAt = DateTime.parse(json['created_at']);
}
