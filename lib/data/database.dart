import 'package:primeiro_projeto/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, version: 2, onCreate: (Database db, int version)
  async {
    await db.execute(TaskDao.tableSql);
  }, onUpgrade: (Database db, int oldVersion, int newVersion) async { if (oldVersion < newVersion) { await db.execute(TaskDao.tableSql); } }, ); }




