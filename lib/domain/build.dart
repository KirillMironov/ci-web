import 'package:ci_web/domain/commit.dart';

class Build {
  final Commit commit;
  final String status;
  final int? logId;

  Build.fromJson(Map<String, dynamic> json)
      : commit = Commit.fromJson(json['commit']),
        status = json['status'],
        logId = json['log_id'];
}
