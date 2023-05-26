// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import'../lib/data/todo_database.dart';
import '../lib/models/todo.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Test group for TodoListDB
  group('TodoListDB', () {
    late TodoListDB todoListDB;

    setUp(() {
      todoListDB = TodoListDB();
    });

    // Test case: Initializes the database correctly
    test('Initializes the database correctly', () async {
      final database = await TodoListDB.initializeDatabase();
      // Expect the database to be open
      expect(database.isOpen, true);
    });

    // Test case: Inserts a todo correctly
    test('Inserts a todo correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );
      // Insert the todo
      await TodoListDB.insertTodo(todo);

      // Get all todos from the database
      final todos = await TodoListDB.getTodos();
      // Expect the properties of the retrieved todo to match the inserted todo
      expect(todos.length, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Task 1');
      expect(todos[0].dueDate, DateTime(2023, 5, 26));
      expect(todos[0].isPriority, true);
      expect(todos[0].isCompleted, false);
    });

    // Test case: Updates the todo title correctly
    test('Updates the todo title correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );
      // Insert the todo
      await TodoListDB.insertTodo(todo);
      // Update the todo title
      await TodoListDB.updateTodoTitle(1, 'Updated Task 1');

      // Get all todos from the database
      final todos = await TodoListDB.getTodos();
      expect(todos.length, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Updated Task 1');
      expect(todos[0].dueDate, DateTime(2023, 5, 26));
      expect(todos[0].isPriority, true);
      expect(todos[0].isCompleted, false);
    });

    test('Updates the todo due date correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );

      await TodoListDB.insertTodo(todo);
      await TodoListDB.updateTodoDueDate(1, DateTime(2023, 5, 27));

      final todos = await TodoListDB.getTodos();
      expect(todos.length, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Task 1');
      expect(todos[0].dueDate, DateTime(2023, 5, 27));
      expect(todos[0].isPriority, true);
      expect(todos[0].isCompleted, false);
    });

    // Test case: Updates the todo priority correctly
    test('Updates the todo priority correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );

      await TodoListDB.insertTodo(todo);
      // Update the todo priority
      await TodoListDB.updateTodoPriority(1, false);

      //Get all todos from the database
      final todos = await TodoListDB.getTodos();
      expect(todos.length, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Task 1');
      expect(todos[0].dueDate, DateTime(2023, 5, 26));
      expect(todos[0].isPriority, false);
      expect(todos[0].isCompleted, false);
    });

    // Test case: Updates the todo completion correctly
    test('Updates the todo completion correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );

      await TodoListDB.insertTodo(todo);
      await TodoListDB.updateTodoCompletion(1, true);

      final todos = await TodoListDB.getTodos();
      // Expect the completion status of the updated todo to match the new status.
      expect(todos.length, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Task 1');
      expect(todos[0].dueDate, DateTime(2023, 5, 26));
      expect(todos[0].isPriority, true);
      expect(todos[0].isCompleted, true);
    });

    // Test case: Deletes the todo correctly
    test('Deletes the todo correctly', () async {
      final todo = Todo(
        id: 1,
        title: 'Task 1',
        dueDate: DateTime(2023, 5, 26),
        isPriority: true,
        isCompleted: false,
      );

      await TodoListDB.insertTodo(todo);
      await TodoListDB.deleteTodo(1);
      // Get all todos from the database.
      final todos = await TodoListDB.getTodos();
      // Expect the list to be empty.
      expect(todos.length, 0);
    });
  });

}
