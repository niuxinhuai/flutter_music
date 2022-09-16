import 'dart:io';

import 'package:flutter_music/repository/database/base_db_helper.dart';
import 'package:flutter_music/repository/database/database_initer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper extends BaseDBHelper {
  static Database? _db;
  static const int curDBVersion = 1;
  static final DbHelper _singleton = DbHelper._();
  DbHelper._();

  factory DbHelper() => _singleton;

  static DbHelper get instance => _singleton;

  static Future<Database?> get _database async {
    if (null == _db) {
      var path = await getDatabasesPath();
      await Directory(path).create(recursive: true);
      path = join(path, "fun_flutter.db");
      _db =
          await openDatabase(path, onCreate: _onCreate, version: curDBVersion);
    }
    return _db;
  }

  static _onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      //使用事务进行初始化数据库操作
      for (String sql in DBInitialize.dbInitList) {
        await txn.execute(sql);
      }
    });
  }

  @override
  Future<Database?> getDatabase() {
    return _database;
  }
}
