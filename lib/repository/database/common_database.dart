import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/repository/database/database_helper.dart';
import 'package:flutter_music/repository/database/database_keys.dart';
import 'package:sqflite/sqflite.dart';

class CommonDb {
  ///清空用户数据
  static Future<bool> clearAllDbs() async {
    List<Map<String, dynamic>> tables = await DbHelper.instance.rawQuery(
        "select name from sqlite_master where type='table' and name!='sqlite_sequence'");
    return DbHelper.instance.transaction((txn) async {
      var batch = txn.batch();
      for (Map<String, dynamic> table in tables) {
        if (((table['name'] ?? '') as String).startsWith('t_')) {
          batch.delete(table['name']);
        }
      }
      await batch.commit(noResult: true);
      return true;
    });
  }

  ///更新历史搜索表
  static Future<int> updateSearchHistoryLog(UserSearchLog log) {
    return DbHelper.instance.insert(
        TUserSearchHistoryProperty.TABLE_NAME, log.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///根据time排序获取搜索历史记录
  static Future<List<UserSearchLog>> getAllSearchHistoryLog(
      {String sc = "desc"}) {
    return DbHelper.instance
        .query(TUserSearchHistoryProperty.TABLE_NAME,
            orderBy: "${TUserSearchHistoryProperty.cTime} $sc")
        .then((items) {
      List<UserSearchLog> logs = [];
      items.forEach((element) => logs.add(UserSearchLog.fromJson(element)));
      return logs;
    });
  }

  ///清空历史搜索表
  static Future<int> deleteUserSearchHistory() {
    return DbHelper.instance.delete(TUserSearchHistoryProperty.TABLE_NAME);
  }

  ///更新收藏文章id
  static Future<int> updateCollectArticleId(int id) {
    return DbHelper.instance.insert(TUserCollectProperty.TABLE_NAME, {"id": id},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///取消收藏单条文章
  static Future<int> unCollectArticleId(int id) {
    return DbHelper.instance
        .delete(TUserCollectProperty.TABLE_NAME, where: "id=$id");
  }

  ///当前文章是否被收藏
  static Future<bool> articleHasCollect(int id) {
    return DbHelper.instance
        .query(TUserCollectProperty.TABLE_NAME, where: "id=$id")
        .then((items) {
      return items.length != 0;
    });
  }

  ///获取所有的收藏列表
  static Future<List<int>> getAllArticleCollect() {
    return DbHelper.instance
        .query(TUserCollectProperty.TABLE_NAME)
        .then((items) {
      List<int> list = [];
      if (items.length != 0) {
        for (Map<String, dynamic> map in items) {
          if (map.keys.contains("id")) {
            list.add(map["id"]);
          }
        }
      }
      return list;
    });
  }

  ///删除所有收藏
  static Future<int> deleteUserCollectHistory() {
    return DbHelper.instance.delete(TUserCollectProperty.TABLE_NAME);
  }
}
