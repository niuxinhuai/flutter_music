import 'package:flutter_music/repository/database/database_keys.dart';

class DBInitialize {
  static var dbInitList = [
    _createSearchLog,
    _createCollectLog,
  ];

  static var _createSearchLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserSearchHistoryProperty.TABLE_NAME} (
	 ${TUserSearchHistoryProperty.cKeyWord} TEXT NOT NULL,
	 ${TUserSearchHistoryProperty.cTime} INTEGER NOT NULL,
	PRIMARY KEY(${TUserSearchHistoryProperty.cKeyWord})
)
  ''';

  static var _createCollectLog = '''
  CREATE TABLE IF NOT EXISTS ${TUserCollectProperty.TABLE_NAME} (
	 ${TUserCollectProperty.cId} INTEGER NOT NULL,
	PRIMARY KEY(${TUserCollectProperty.cId})
)
  ''';
}
