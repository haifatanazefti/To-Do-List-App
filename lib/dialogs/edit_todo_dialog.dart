import 'package:flutter/material.dart';
import '../models/todo.dart';

class EditTodoDialog extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onSave;

  const EditTodoDialog({Key? key, required this.todo, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String updatedTitle = todo.title;
    DateTime? updatedDueDate = todo.dueDate;
    bool updatedPriority = todo.isPriority;
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: const Text('Edit Todo'),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
              onChanged: (value) {
                updatedTitle = value;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: TextEditingController(text: updatedTitle),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: updatedDueDate ?? DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030),
                );
                if (selectedDate != null) {
                  updatedDueDate = selectedDate;
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
                    updatedDueDate != null
                      ? 'Due: ${updatedDueDate.toString().substring(0, 10)}'
                      : 'Select due date',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Priority'),
              value: updatedPriority,
              checkColor: Colors.red,
              activeColor: Colors.grey[300],
              onChanged: (value) {
                updatedPriority = value ?? false;
              },
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
              Icons.edit_outlined,
              size: 18,
              color: Colors.deepOrange,
            ), 
            SizedBox(width: 6), 
            Text(
              'Edit',
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
            // validation of the form
            if (_formKey.currentState!.validate()) {
              final updatedTodo = Todo(
                id: todo.id,
                title: updatedTitle,
                dueDate: updatedDueDate,
                isPriority: updatedPriority,
                isCompleted: todo.isCompleted,
              );
              onSave(updatedTodo);
              Navigator.pop(context);
            }
          },
        ),
      ]
    );
  }
}