import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/widget/input_field.dart';
import 'package:flutter/material.dart';

import '../port/repositories.dart';

class AddRepositoryPage extends StatelessWidget {
  AddRepositoryPage(this.repositoriesService);

  final RepositoriesService repositoriesService;

  static const routeName = '/repositories';

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _branchController = TextEditingController();
  final _pollingIntervalController = TextEditingController();

  void _addRepository(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await repositoriesService
          .add(Repository(
              url: _urlController.text,
              branch: _branchController.text,
              pollingInterval: _pollingIntervalController.text))
          .then(Navigator.of(context).pop)
          .catchError((err) {
        _scaffoldMessengerKey.currentState!
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(err),
            duration: const Duration(seconds: 3),
          ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add repository'),
        ),
        body: Center(
          child: SizedBox(
            width: 1500,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputField(
                      controller: _urlController,
                      hintText: 'url',
                    ),
                    const SizedBox(height: 8),
                    InputField(
                      controller: _branchController,
                      hintText: 'branch',
                    ),
                    const SizedBox(height: 8),
                    InputField(
                      controller: _pollingIntervalController,
                      hintText: 'polling interval (3s, 5m, 1h)',
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _addRepository(context),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
