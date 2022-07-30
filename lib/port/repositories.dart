import '../domain/repository.dart';

abstract class RepositoriesService {
  Future putRepository(Repository repository);
  Future deleteRepository(RepositoryURL url);
}
