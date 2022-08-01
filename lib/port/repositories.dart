import '../domain/repository.dart';

abstract class RepositoriesService {
  Future<void> putRepository(Repository repository);
  Future<void> deleteRepository(RepositoryURL url);
}
