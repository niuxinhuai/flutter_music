import 'package:sqflite/sqflite.dart';

abstract class BaseDBHelper {
  Future<Database?> getDatabase();

  Future<int> insert(String table, Map<String, dynamic> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    return getDatabase().then((db) => db!.insert(table, values,
        nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm));
  }

  Future<int> delete(String? table, {String? where, List<dynamic>? whereArgs}) {
    return getDatabase()
        .then((db) => db!.delete(table!, where: where, whereArgs: whereArgs));
  }

  Future<int> update(String table, Map<String, dynamic> values,
      {String? where,
      List<dynamic>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
    return getDatabase().then((db) => db!.update(table, values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: conflictAlgorithm));
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<dynamic>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    return getDatabase().then((db) => db!.query(table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset));
  }

  Future<int> rawInsert(String sql, [List<dynamic>? arguments]) {
    return getDatabase().then((db) => db!.rawInsert(sql, arguments));
  }

  Future<int> rawDelete(String sql, [List<dynamic>? arguments]) {
    return getDatabase().then((db) => db!.rawDelete(sql, arguments));
  }

  Future<int> rawUpdate(String sql, [List<dynamic>? arguments]) {
    return getDatabase().then((db) => db!.rawUpdate(sql, arguments));
  }

  Future<List<Map<String, dynamic>>> rawQuery(String sql,
      [List<dynamic>? arguments]) {
    return getDatabase().then((db) => db!.rawQuery(sql, arguments));
  }

  Future<int> rawQueryCount(String sql, [List<dynamic>? arguments]) {
    return getDatabase()
        .then((db) => db!.rawQuery(sql, arguments))
        .then((value) {
      if (value.isEmpty) return 0;
      Map map = value[0];
      return map.values.first;
    });
  }

  Future<void> execute(String sql, [List<dynamic>? arguments]) {
    return getDatabase().then((db) => db!.execute(sql, arguments));
  }

  Future<T> transaction<T>(Future<T> action(Transaction txn),
      {bool? exclusive}) {
    return getDatabase()
        .then((db) => db!.transaction(action, exclusive: exclusive));
  }
}
