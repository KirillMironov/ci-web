class Repository {
  late final String id;
  final String url;
  final String branch;
  final String pollingInterval;

  Repository(this.url, this.branch, this.pollingInterval);

  Repository.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        branch = json['branch'],
        pollingInterval = json['polling_interval'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'branch': branch,
        'polling_interval': pollingInterval,
      };
}
