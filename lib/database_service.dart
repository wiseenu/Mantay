import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wis/ListModel.dart';

class MantayDatabase {
  static final MantayDatabase instance = MantayDatabase._init();
  static Database? _database;

  MantayDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mantay.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableModel (
      ${ModelFields.id} $idType,
      ${ModelFields.name} $textType,
      ${ModelFields.uk1}  $textType,
      ${ModelFields.uk2}  $textType,
      ${ModelFields.uk3}  $textType

    )''');
  }

  Future<ModelList> create(ModelList modelList) async {
    final db = await instance.database;
    // final json = modelList.toJson();
    //  final columns =
    //      '${ModelFields.name}, ${ModelFields.uk1}, ${ModelFields.uk2}, ${ModelFields.uk3}';
    //  final values =
    //      '${json[ModelFields.name]}, ${json[ModelFields.uk1]}, ${json[ModelFields.uk2]}, ${json[ModelFields.uk3]}';

    //  final id = await db
    //      .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableModel, modelList.toJson());
    return modelList.copy(id: id);
  }

  Future<ModelList> readModelList(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableModel,
      columns: ModelFields.values,
      where: '${ModelFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ModelList.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ModelList>> readAllModelList() async {
    final db = await instance.database;
    final orderBy = '${ModelFields.name} ASC';
    final result = await db.query(tableModel, orderBy: orderBy);

    return result.map((json) => ModelList.fromJson(json)).toList();
  }

  Future<int> update(ModelList modelList) async {
    final db = await instance.database;

    return db.update(
      tableModel,
      modelList.toJson(),
      where: '${ModelFields.id} = ?',
      whereArgs: [modelList.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableModel,
      where: '${ModelFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    return db.close();
  }
  /*
  static final Database _databaseService = Database._internal();
  factory Database() => _databaseService;
  Database._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE models(id INTEGER PRIMARY KEY, name TEXT, uk1 INTEGER, uk2 INTEGER, uk3 INTEGER)');
  }*/
}
