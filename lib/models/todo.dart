// class Todo 
class Todo {
  final int id;
  final String title;
  final DateTime? dueDate;
  final bool isPriority;
  final bool isCompleted;
  // constructor fo todo class with required id and title
  Todo({
    required this.id,
    required this.title,
    this.dueDate,
    this.isPriority = false,
    this.isCompleted = false,
  });
}