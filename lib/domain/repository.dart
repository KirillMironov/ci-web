class Repository {
  final String url;
  final String branch;
  final String pollingInterval;

  late final String id;
  late final DateTime createdAt;

  Repository(this.url, this.branch, this.pollingInterval);

  Repository.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        branch = json['branch'],
        pollingInterval = json['polling_interval'],
        createdAt = DateTime.parse(json['created_at']);

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
