typedef RepositoryURL = String;

class Repository {
  Repository({
    required this.url,
    required this.branch,
    required this.pollingInterval,
    this.latestCommit = '',
  });

  final RepositoryURL url;
  final String branch;
  final String pollingInterval;
  final String latestCommit;

  Repository.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        latestCommit = json['latest_commit'],
        branch = '',
        pollingInterval = '';

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
