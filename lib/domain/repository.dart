typedef RepositoryURL = String;

class Repository {
  Repository({
    required this.url,
    required this.branch,
    required this.pollingInterval,
    this.id = '',
    this.latestCommit = '',
  });

  final String id;
  final RepositoryURL url;
  final String branch;
  final String pollingInterval;
  final String latestCommit;

  Repository.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        branch = json['branch'] ?? '',
        latestCommit = json['latest_commit'] ?? '',
        pollingInterval = json['polling_interval'] ?? '';

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
