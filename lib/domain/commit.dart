class Commit {
  final String hash;

  Commit.fromJson(Map<String, dynamic> json)
      : hash = json['hash'];
}
