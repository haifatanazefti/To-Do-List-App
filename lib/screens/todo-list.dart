import 'package:flutter/material.dart';
import '../components/left-drawer.dart';
import '../dialogs/add_todo_dialog.dart';
import '../dialogs/edit_todo_dialog.dart';
import '../models/todo.dart';
import '../data/todo_database.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
class TodoListScreenn extends StatefulWidget {
  const TodoListScreenn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreennState createState() => _TodoListScreennState();
}

class _TodoListScreennState extends State<TodoListScreenn> {
  Future<List<Todo>>? _todosFuture;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    super.initState();
    _todosFuture = TodoListDB.getTodos();
  }

  void _refreshTodoList() {
    setState(() {
      _todosFuture = TodoListDB.getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddTodoItemDialog(context);
        },
      ),
      body: SliderDrawer(
        appBar: const SliderAppBar(
          appBarColor: Color.fromARGB(243, 245, 255, 255),
          title: Text("home",
            style:  TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w700
            )
          )
        ),
        key: _sliderDrawerKey,
        sliderOpenSize: 185,
        slider: SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();
            setState(() {
            });
          },
        ),
        child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
        color: const Color.fromARGB(243, 245, 255, 255), 
        child: Column(
          children: [
            Row(
              children: const[
                Padding(
                padding:  EdgeInsets.fromLTRB(0, 20, 0, 20), 
                child: Text(
                  "What's up Haifa 👋",
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto Mono',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(243, 245, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'All Categories',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto Mono',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 8),
                              child: Card(
                              elevation: 2,
                                child: Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:  [
                                        Row(
                                          children: [
                                            const Text(
                                            '58',
                                            style:  TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.bar_chart,
                                            color: Color.fromARGB(172, 0, 0, 0),
                                            size: 20,
                                          )
                                            ],
                                          ),
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                          child: Text(
                                            'Business',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(172, 0, 0, 0),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                          child: Container(
                                            width: 80,
                                            height: 2,color: Colors.deepOrangeAccent,
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 8),
                              child: Card(
                              elevation: 2,
                              child: Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            '40',
                                            style:  TextStyle(
                                            color: Colors.blue,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                              Icons.people_alt_outlined,
                                              color: Color.fromARGB(172, 0, 0, 0),
                                              size: 20,
                                            ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                        child: Text(
                                          'Personal',
                                          style:  TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Color.fromARGB(172, 0, 0, 0),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                        child: Container(
                                          width: 40,
                                          height: 2,color: Colors.blue,
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 8),
                              child: Card(
                              elevation: 2,
                                child: Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                            '60',
                                            style:  TextStyle(
                                            color: Colors.pink,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.access_time,
                                              color: Color.fromARGB(172, 0, 0, 0),
                                              size: 20,
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                          child: Text(
                                            'Activities',
                                            style:  TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color.fromARGB(172, 0, 0, 0),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                          child: Container(
                                            width: 60,
                                            height: 2,
                                            color: Colors.pink,
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), 
                child: Text(
                  "All to do tasks",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto Mono',
                  ),
                ),
              ),
              ],
            ),
            Expanded(
              child: Container(
                child: FutureBuilder<List<Todo>>(
                future: _todosFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child:  CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final todos = snapshot.data ?? [];
                  if (todos.isEmpty) {
                    return const Center(
                      child: Text('No todos found.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                        child: Container( 
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                          child: ListTile(
                            title: Text(todo.title),
                            subtitle: todo.dueDate != null ? Text('Due: ${todo.dueDate.toString().substring(0,16)}') : null,
                            leading: Container(
                              width: 50,
                              child: Row(
                                children: [
                                if (todo.isPriority)                         
                                  Container(
                                    width: 4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                                  value: todo.isCompleted,
                                  onChanged: (value) {
                                    TodoListDB.updateTodoCompletion(todo.id, value ?? false);
                                    _refreshTodoList();
                                  },
                                ),
                                ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete, 
                                color: Colors.redAccent, 
                                size: 20,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirmation'),
                                      content: const Text('Are you sure you want to delete it?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Dismiss the dialog
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Confirm'),
                                          onPressed: () {
                                            TodoListDB.deleteTodo(todo.id);
                                            _refreshTodoList();
                                            Navigator.of(context).pop(); // Dismiss the dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            onTap: () {
                              _showEditTodoItemDialog(context, todo);
                            }, 
                          )
                        ),
                      )
                    );
                    },
                  );
                },
              ),
            ),
          ),
        ],
        )
        ), 
      ),
    ),
    );
  }
  
  void _showAddTodoItemDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AddTodoDialog(
        onAddTodo: (todo) {
          TodoListDB.insertTodo(todo);
          _refreshTodoList();
        },
      );
    },
  );
}
 void _showEditTodoItemDialog(BuildContext context, Todo todo) {
  showDialog(
    context: context,
    builder: (context) {
      return EditTodoDialog(
        todo: todo,
        onSave: (updatedTodo) {
          TodoListDB.updateTodoTitle(updatedTodo.id, updatedTodo.title);
          TodoListDB.updateTodoDueDate(updatedTodo.id, updatedTodo.dueDate);
          TodoListDB.updateTodoPriority(updatedTodo.id, updatedTodo.isPriority);
          _refreshTodoList();
        },
      );
    },
  );}
}
