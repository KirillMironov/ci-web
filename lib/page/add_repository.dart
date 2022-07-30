import 'package:ci_web/domain/repository.dart';
import 'package:ci_web/widget/input_field.dart';
import 'package:flutter/material.dart';

import '../port/repositories.dart';

class AddRepository extends StatefulWidget {
  const AddRepository(this.repositoriesService);

  final RepositoriesService repositoriesService;

  @override
  State<AddRepository> createState() => _AddRepositoryState();
}

class _AddRepositoryState extends State<AddRepository> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _branchController = TextEditingController();
  final _pollingIntervalController = TextEditingController();

  _addRepository() async {
    if (_formKey.currentState!.validate()) {
      await widget.repositoriesService
          .putRepository(Repository(
              url: _urlController.text,
              branch: _branchController.text,
              pollingInterval: _pollingIntervalController.text))
          .catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 3),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add repository'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                onPressed: _addRepository,
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
