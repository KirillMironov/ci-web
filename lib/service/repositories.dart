import 'dart:convert';
import 'dart:io';

import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:http/http.dart' as http;

class Repositories implements RepositoriesService {
  Repositories(this.apiEndpoint);

  final String apiEndpoint;

  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  @override
  Future<void> add(Repository repository) {
    final uri = Uri.parse('$apiEndpoint/repositories');
    final body = jsonEncode(repository.toJson());

    return http.post(uri, headers: headers, body: body).then((resp) {
      if (resp.statusCode != HttpStatus.created) {
        return Future.error('Failed to put repository: ${resp.body}');
      }
    });
  }

  @override
  Future<void> delete(String url) {
    final uri = Uri.parse('$apiEndpoint/repositories');
    final body = {'url': url};

    return http.delete(uri, headers: headers, body: body).then((resp) {
      if (resp.statusCode != HttpStatus.noContent) {
        return Future.error('Failed to delete repository: ${resp.body}');
      }
    });
  }

  @override
  Future<Repository> getById(String id) {
    final uri = Uri.parse('$apiEndpoint/repositories/$id');
    return http.get(uri).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error('Failed to get repository: ${resp.body}');
      }

      return Repository.fromJson(jsonDecode(resp.body));
    });
  }

  @override
  Future<List<Repository>> getAll() {
    final uri = Uri.parse('$apiEndpoint/repositories');

    return http.get(uri).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error('Failed to get repositories: ${resp.body}');
      }

      final data = jsonDecode(resp.body)['repositories'];
      return data is List
          ? data.map((repository) => Repository.fromJson(repository)).toList()
          : [];
    });
  }
}
