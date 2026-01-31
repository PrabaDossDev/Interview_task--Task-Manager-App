import '../../core/model/helper/db_helper.dart';
import '../../core/model/task.dart';

class TaskService {
  final DBHelper _dbHelper = DBHelper();

  Future<void> init() async {
    await _dbHelper.database;
  }

  Future<List<Task>> getTasks() async {
    final db = await _dbHelper.database;
    final data = await db.query('tasks');
    return data.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> addTask(Task task) async {
    final db = await _dbHelper.database;
    await db.insert('tasks', task.toMap());
  }

  Future<void> updateTask(Task task) async {
    final db = await _dbHelper.database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(String id) async {
    final db = await _dbHelper.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clear() async {
    final db = await _dbHelper.database;
    await db.delete('tasks');
  }
}
