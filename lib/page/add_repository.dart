import 'package:flutter/material.dart';

import '../domain/repository.dart';
import '../port/repositories.dart';
import '../widget/input_field.dart';

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
          .add(
            Repository(
              _urlController.text,
              _branchController.text,
              _pollingIntervalController.text,
            ),
          )
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: 1500,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }
}
