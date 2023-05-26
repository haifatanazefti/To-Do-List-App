import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo.dart';

class TodoListDB {
  static Database? _database;
  static const String tableName = 'todos';
  //get the database
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }
  // initialize database 
  static Future<Database> initializeDatabase() async {
    //get the path to the directory where the database 'todo_database.db' is stored.
    final path = await getDatabasesPath();
    // concatenate the path and todo_database.db
    final databasePath = join(path, 'todo_database.db');
    /*open the database and then create a table named 'todos' that contains 5 attributes : 
      id: Integer (primary key auto increment)
      title: String
      dueDate: Integer 
      isPriority: Integer 
      isCompleted: Integer
    */
    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            dueDate INTEGER,
            isPriority INTEGER,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  // get list of to do list 
  static Future<List<Todo>> getTodos() async {
    // call database
    final db = await database;
    final todos = await db.query(tableName, orderBy: 'dueDate ASC',);
    //return a todos list that contains Todo objects
    return todos.map((todo) => Todo(
      id: todo['id'] as int,
      title: todo['title'] as String,
      dueDate: todo['dueDate'] != null ? DateTime.fromMillisecondsSinceEpoch(todo['dueDate'] as int) : null,
      isPriority: todo['isPriority'] == 1,
      isCompleted: todo['isCompleted'] == 1,
    )).toList();
  }

  //insert new to do to the list 
  static Future<void> insertTodo(Todo todo) async {
    final db = await database;
    /* insert into databse new todo object :
      title and dueDate with specific value
      if i specify the value of priority => it value = 1 else 0
      idm for the isCompleted attribute
    */
    await db.insert(
      tableName,
      {
        'title': todo.title,
        'dueDate': todo.dueDate?.millisecondsSinceEpoch,
        'isPriority': todo.isPriority ? 1 : 0,
        'isCompleted': todo.isCompleted ? 1 : 0,
      },
      //conflict resolution when inserting new data
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //update the title of an existing to do item 
  static Future<void> updateTodoTitle(int id, String newTitle) async {
    final db = await database;
    await db.update(
      tableName,
      {'title': newTitle},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //update the duo date of an existing to do item 
  static Future<void> updateTodoDueDate(int id, DateTime? newDueDate) async {
    final db = await database;
    await db.update(
      tableName,
      {'dueDate': newDueDate?.millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //priotirize important to do items
  static Future<void> updateTodoPriority(int id, bool isPriority) async {
    final db = await database;
    //specify the id and update the attribute isPriority 
    await db.update(
      tableName,
      {'isPriority': isPriority ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // mark to do items as completed or uncompleted
  static Future<void> updateTodoCompletion(int id, bool isCompleted) async {
    final db = await database;
    //specify the id and update the attribute isCompleted 
    await db.update(
      tableName,
      {'isCompleted': isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // delete the to do item 
  static Future<void> deleteTodo(int id) async {
    final db = await database;
    // specify the id 
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}