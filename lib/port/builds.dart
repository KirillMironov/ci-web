import '../domain/build.dart';

abstract class BuildsService {
  Future<Build> getById(String id, repositoryId);
  Future<List<Build>> getAllByRepositoryId(String repositoryId);
}
