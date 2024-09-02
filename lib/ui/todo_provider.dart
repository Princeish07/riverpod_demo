import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/ui/todo_state.dart';
import 'dart:math';

import '../data/model/todo_model.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(TodoState(todos: [], isLoading: false));

  Future<void> addTodo(String title, String description,int price)

  async {
    _setLoading(true);
    final newTodo = Todo(
      id: Random().nextInt(100000).toString(),
      title: title,
      description: description,
      price: price

    );
    await Future.delayed(const Duration(seconds: 4));
    state = TodoState(todos: [...state.todos, newTodo], isLoading: false);
  }

  Future<void> updateTodo(String id, String title, String description,int price)

  async {
    _setLoading(true);

    await Future.delayed(const Duration(seconds: 4));

    state = TodoState(todos: [
      for (final todo in state.todos)
        if (todo.id == id)
          Todo(
            id: id,
            title: title,
            description: description,
            price: price
          )
        else
          todo,
    ], isLoading: false);
  }

  Future<void> deleteTodo(String id)

  async {
    _setLoading(true);

    await  Future.delayed(const Duration(seconds: 4));
    state = TodoState(todos: state.todos.where((todo) => todo.id != id).toList(), isLoading: false);
  }

  void _setLoading(bool isLoading) {
    state = TodoState(todos: state.todos, isLoading: isLoading);
  }

}

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref)
    {
  return TodoNotifier();
   }
);
