import 'dart:convert';
import 'dart:io';

import 'package:ci_web/domain/build.dart';
import 'package:http/http.dart' as http;

import '../port/builds.dart';

class Builds implements BuildsService {
  Builds(this.apiEndpoint);

  final String apiEndpoint;

  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  @override
  Future<Build> getById(String id, repositoryId) {
    final uri = Uri.parse('$apiEndpoint/repositories/$repositoryId/builds/$id');
    return http.get(uri).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error('Failed to get build: ${resp.body}');
      }

      return Build.fromJson(jsonDecode(resp.body));
    });
  }

  @override
  Future<List<Build>> getAllByRepositoryId(String repositoryId) {
    final uri = Uri.parse('$apiEndpoint/repositories/$repositoryId/builds');

    return http.get(uri).then((resp) {
      if (resp.statusCode != HttpStatus.ok) {
        return Future.error('Failed to get builds: ${resp.body}');
      }

      final data = jsonDecode(resp.body)['builds'];
      return data is List
          ? data.map((build) => Build.fromJson(build)).toList()
          : [];
    });
  }
}
