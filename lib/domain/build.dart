import 'package:ci_web/domain/commit.dart';

class Build {
  final String id;
  final String logId;
  final Commit commit;
  final String status;

  Build.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        logId = json['log_id'],
        commit = Commit.fromJson(json['commit']),
        status = json['status'];
}
