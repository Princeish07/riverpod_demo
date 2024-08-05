import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/ui/todo_provider.dart';

class CreateTodoPage extends ConsumerWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);

    return
      Stack(
        children: [
          Scaffold(
          appBar: AppBar(title: Text('Create Todo')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                   await ref.read(todoProvider.notifier).addTodo(
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
              ),
          if(todoState.isLoading) ...[
            Container(
                color: Colors.grey.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()))
          ]
        ],
      );
  }
}
