import 'commit.dart';
import 'status.dart';

class Build {
  final String id;
  final Commit commit;
  final Status status;
  final DateTime createdAt;

  Build.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        commit = Commit.fromJson(json['commit']),
        status = Status.fromString(json['status'] ?? ''),
        createdAt = DateTime.parse(json['created_at']);
}
