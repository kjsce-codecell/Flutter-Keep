import 'package:flutterkeep/helpers/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const _databaseName = 'flutterKeep.db';
  static const _databaseVersion = 1;

  static const _tableName = 'notes';

  static const _id = "_id";
  static const _title = "title";
  static const _note = "note";
  static const _date = "date";
  static const _backgroundColor = "backgroundColor";
  static const _textColor = "textColor";

  static final List<String> _values = [
    _id,
    _title,
    _note,
    _date,
    _backgroundColor,
    _textColor
  ];
  static final DatabaseManager instance = DatabaseManager._init();

  static Database? _database;

  DatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String directory = await getDatabasesPath();
    String path = join(directory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_id INTEGER PRIMARY KEY,
        $_title TEXT NOT NULL,
        $_note TEXT NOT NULL,
        $_date TEXT NOT NULL,
        $_backgroundColor INTEGER NOT NULL,
        $_textColor INTEGER NOT NULL
      )
    ''');
  }

  Future<Note> insert(Note note) async {
    Database db = await instance.database;
    final id = await db.insert(_tableName, note.toMap());
    return note.copy(id_: id);
  }

  Future<List<Note>> getAllNotes() async {
    Database db = await instance.database;
    final allNotesMap = await db.query(_tableName);
    return allNotesMap.map((map) => Note.fromMap(map)).toList();
  }

  Future<Note> getNoteFromId(int id) async {
    Database db = await instance.database;
    final foundNotes = await db.query(_tableName,
        columns: _values, where: '$_id = ?', whereArgs: [id]);
    if (foundNotes.isNotEmpty) {
      return Note.fromMap(foundNotes[0]);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future update(Note note) async {
    Database db = await instance.database;
    await db.update(_tableName, note.toMap(),
        where: '$_id = ?', whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  }

  Future close() async {
    Database db = await instance.database;
    db.close();
  }
}
