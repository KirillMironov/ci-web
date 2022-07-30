typedef RepositoryURL = String;

class Repository {
  Repository({
    required this.url,
    required this.branch,
    required this.pollingInterval,
  });

  final RepositoryURL url;
  final String branch;
  final String pollingInterval;

  Repository.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        branch = json['branch'],
        pollingInterval = json['polling_interval'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
