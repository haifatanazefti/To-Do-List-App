import 'package:flutter/material.dart';
import '../models/todo.dart';

class AddTodoDialog extends StatelessWidget {
  final Function(Todo) onAddTodo;

  const AddTodoDialog({Key? key, required this.onAddTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    DateTime? dueDate;
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: const Text(
        'Add Todo',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
      ),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              // validator for checking if the field is empty or not
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
              onChanged: (value) {
                title = value;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                if (selectedDate != null) {
                  dueDate = selectedDate;
                }
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dueDate != null
                      ? 'Due: ${dueDate.toString().substring(0, 10)}'
                      : 'Select due date',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions:  [
        OutlinedButton(
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.clear_rounded,
              size: 18,
              color: Colors.deepOrange,
            ), 
            SizedBox(width: 6), 
            Text(
              'Cancel',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ), 
          ],
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Specify the border radius
          ),
          side: const BorderSide(color: Colors.deepOrange),
          ),
          onPressed: () {
              Navigator.pop(context);
          },
        ),
        OutlinedButton(
          child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add_rounded,
              size: 18,
              color: Colors.deepOrange,
            ), 
            SizedBox(width: 6), 
            Text(
              'Add',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ), 
          ],
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Specify the border radius
          ),
          side: const BorderSide(color: Colors.deepOrange), // Specify the border color
          ),
          onPressed: () {
            // validate the form then add new to do item
            if (_formKey.currentState!.validate()) {
              final todo = Todo(
                id: DateTime.now().millisecondsSinceEpoch,
                title: title,
                dueDate: dueDate,
              );
              onAddTodo(todo);
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}