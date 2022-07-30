import 'dart:convert';

import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:http/http.dart' as http;

class Repositories implements RepositoriesService {
  Repositories(this.apiEndpoint);

  final String apiEndpoint;

  @override
  Future putRepository(Repository repository) async {
    final uri = Uri.parse('$apiEndpoint/repositories');

    http.put(uri, body: json.encode(repository.toJson())).then((resp) {
      if (resp.statusCode != 200) {
        return Future.error('Failed to put repository: ${resp.body}');
      }
      return null;
    });
  }

  @override
  Future deleteRepository(RepositoryURL url) async {
    final uri = Uri.parse('$apiEndpoint/repositories');

    http.delete(uri, body: json.encode({'url': url})).then((resp) {
      if (resp.statusCode != 200) {
        return Future.error('Failed to delete repository: ${resp.body}');
      }
      return null;
    });
  }
}
