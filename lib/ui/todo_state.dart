import '../data/model/todo_model.dart';

class TodoState {
  final List<Todo> todos;
  final bool isLoading;

  TodoState({required this.todos, required this.isLoading});
}