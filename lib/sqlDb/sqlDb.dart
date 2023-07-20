import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_bloc/Model/ModelClass.dart';

class DbHelper {
  static const _databaseName = "MyDatabase.db";
  static const dbTable = "dbTable";

  static final _databaseVersion = 1;

  static Database? _database;

  static final DbHelper _databaseHelper = DbHelper();
  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  static _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    print("heloo");
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {
    print("dhfhkjhfjfgfhkhdjfjdf");
    await db.execute('''
          CREATE TABLE $dbTable(
            Id INTEGER PRIMARY KEY AUTOINCREMENT,
            API Text,
            Description Text,
            Auth Text,
            HTTPS Text,
            Cors Text,
            Link Text,
            Category TEXT
         )
    ''');
  }

  readRecord() async {
    Database? db = await database;

    return await db?.query(dbTable);
  }

  insertRecord(Map<String, dynamic> row) async {
    Database? db = await database;

    return db?.insert(dbTable, row);
  }
}
