import 'package:ci_web/page/add_repository.dart';
import 'package:ci_web/page/home.dart';
import 'package:ci_web/page/not_found.dart';
import 'package:ci_web/page/repository.dart';
import 'package:ci_web/port/builds.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:ci_web/service/builds.dart';
import 'package:ci_web/service/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(App());
}

const String apiEndpoint = 'http://localhost:8080/api/v1';

class App extends StatelessWidget {
  final ThemeData theme = ThemeData();

  final RepositoriesService repositoriesService = Repositories(apiEndpoint);
  final BuildsService buildsService = Builds(apiEndpoint);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ci-web',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(repositoriesService),
        AddRepositoryPage.routeName: (_) =>
            AddRepositoryPage(repositoriesService),
      },
      onGenerateRoute: (settings) {
        Widget page = NotFoundPage();

        if (settings.name!.startsWith('/repositories/')) {
          final id = settings.name!.substring('/repositories/'.length);
          if (id.isNotEmpty) {
            page = RepositoryPage(id, repositoriesService, buildsService);
          }
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => page,
        );
      },
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
