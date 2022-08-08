import 'package:ci_web/page/add_repository.dart';
import 'package:ci_web/page/home.dart';
import 'package:ci_web/page/not_found.dart';
import 'package:ci_web/page/repository.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:ci_web/service/repositories.dart';
import 'package:ci_web/widget/primary_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(App());
}

class App extends StatelessWidget {
  final ThemeData theme = ThemeData();
  final RepositoriesService service =
      Repositories('http://localhost:8080/api/v1');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ci-web',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(service),
        AddRepositoryPage.routeName: (_) => AddRepositoryPage(service),
      },
      onGenerateRoute: (settings) {
        Widget page = NotFoundPage();

        if (settings.name!.startsWith('/repositories/')) {
          final id = settings.name!.substring('/repositories/'.length);
          if (id.isNotEmpty) {
            page = RepositoryPage(id, service);
          }
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => page,
        );
      },
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryColor,
          backgroundColor: Colors.grey[50],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
