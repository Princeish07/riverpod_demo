import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/ui/todo_provider.dart';

import '../data/model/todo_model.dart';

class UpdateTodoPage extends ConsumerWidget {
  final Todo todo;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  UpdateTodoPage({required this.todo})
      : titleController = TextEditingController(text: todo.title),
        descriptionController = TextEditingController(text: todo.description);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Update Todo')),
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
                    await ref.read(todoProvider.notifier).updateTodo(
                          todo.id,
                          titleController.text,
                          descriptionController.text,
                        );
                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),

        if(todoState.isLoading)...[
          Container(
              color: Colors.grey.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()))        ]
      ],
    );
  }
}
