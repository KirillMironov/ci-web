import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/widget/input_field.dart';
import 'package:flutter/material.dart';

import '../port/repositories.dart';

class AddRepository extends StatelessWidget {
  AddRepository(this.repositoriesService);

  final RepositoriesService repositoriesService;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputField(
                      controller: _urlController,
                      hintText: 'url',
                    ),
                    InputField(
                      controller: _branchController,
                      hintText: 'branch',
                    ),
                    InputField(
                      controller: _pollingIntervalController,
                      hintText: 'polling interval',
                    ),
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
