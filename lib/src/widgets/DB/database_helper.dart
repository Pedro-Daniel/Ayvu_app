import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            language_mother TEXT,
            language_recorder TEXT,
            region TEXT,
            conversation TEXT,
            gender TEXT,
            birthDate TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('users', user,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('users');
    //final dbPath = join(await getDatabasesPath(), 'user_data.db');
    //await deleteDatabase(dbPath);
    //_database =
    //    null; // Reseta a instância para garantir que um novo banco será criado
    //print("Banco de dados deletado!");
  }
}
