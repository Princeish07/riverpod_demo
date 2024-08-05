import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/ui/todo_provider.dart';
import 'package:riverpod_demo/ui/update_todo.dart';


import 'create_todo.dart';

class ItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoProvider);

    return
      Stack(
        children:
       [
         Scaffold(
        appBar: AppBar(title: Text('Todos')),
        body: ListView.builder(
          itemCount: todoState.todos.length,
          itemBuilder: (context1, index) {
            final todo = todoState.todos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await ref.read(todoProvider.notifier).deleteTodo(todo.id);
                },
              ),
              onTap: () {
                // Navigate to update page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTodoPage(todo: todo),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to create page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateTodoPage()),
            );
          },
          child: Icon(Icons.add),
        ),
            ),
       if(todoState.isLoading) ...[
         Container(
             color: Colors.grey.withOpacity(0.5),
             child: const Center(child: CircularProgressIndicator()))       ]]
      );
  }
}
