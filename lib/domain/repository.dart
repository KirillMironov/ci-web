import 'build.dart';

class Repository {
  late final String id;
  final String url;
  final String branch;
  final String pollingInterval;
  late final String? latestCommit;
  late final List<Build>? builds;

  Repository.forAdd(this.url, this.branch, this.pollingInterval);

  Repository.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        branch = json['branch'] ?? '',
        pollingInterval = json['polling_interval'] ?? '',
        latestCommit = json['latest_commit'],
        builds = json['builds'] != null
            ? (json['builds'] as List<dynamic>)
                .map((data) => Build.fromJson(data))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
