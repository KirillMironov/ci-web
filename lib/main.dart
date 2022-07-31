import 'package:ci_web/page/add_repository.dart';
import 'package:ci_web/page/home.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:ci_web/service/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(App());
}

class App extends StatelessWidget {
  final ThemeData theme = ThemeData();
  final Color mainColor = const Color(0xFFFFAB91);
  final RepositoriesService service =
      Repositories('http://localhost:8080/api/v1');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ci-web',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(service),
        '/add': (context) => AddRepository(service),
      },
      theme: theme.copyWith(
        primaryColor: mainColor,
        colorScheme: theme.colorScheme.copyWith(secondary: mainColor),
        appBarTheme: theme.appBarTheme.copyWith(
            backgroundColor: mainColor, foregroundColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
