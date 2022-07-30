import 'package:ci_web/page/home.dart';
import 'package:ci_web/port/repositories.dart';
import 'package:ci_web/service/repositories.dart';
import 'package:flutter/material.dart';

void main() {
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
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        primaryColor: mainColor,
        colorScheme: theme.colorScheme.copyWith(secondary: mainColor),
        appBarTheme: theme.appBarTheme.copyWith(
            backgroundColor: mainColor, foregroundColor: Colors.black),
      ),
      home: HomePage(service),
    );
  }
}
