import 'dart:convert';
import 'dart:io';

import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:http/http.dart' as http;

class Repositories implements RepositoriesService {
  Repositories(this.apiEndpoint);

  final String apiEndpoint;

  @override
  Future<void> add(Repository repository) async {
    final uri = Uri.parse('$apiEndpoint/repositories');
    final body = jsonEncode(repository.toJson());

    await http.put(uri, body: body).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error(
            'Failed to put repository: ${resp.statusCode} (${resp.body})');
      }
    });
  }

  @override
  Future<void> delete(RepositoryURL url) async {
    final uri = Uri.parse('$apiEndpoint/repositories');
    final body = {'url': url};

    await http.delete(uri, body: body).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error(
            'Failed to delete repository: ${resp.statusCode} (${resp.body})');
      }
    });
  }

  @override
  Future<List<Repository>> getAll() async {
    final uri = Uri.parse('$apiEndpoint/repositories');
    final resp = await http.get(uri);

    if (resp.statusCode != HttpStatus.ok) {
      return Future.error(
          'Failed to get all repositories: ${resp.statusCode} (${resp.body})');
    }
    return (jsonDecode(resp.body)['repositories'] as List)
        .map((data) => Repository.fromJson(data))
        .toList();
  }
}
