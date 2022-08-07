import '../domain/repository.dart';

abstract class RepositoriesService {
  Future<void> add(Repository repository);
  Future<void> delete(RepositoryURL url);
  Future<Repository> getById(String id);
  Future<List<Repository>> getAll();
}
