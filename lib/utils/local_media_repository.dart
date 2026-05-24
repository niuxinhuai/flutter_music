import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_music/helper/service_helper.dart';
import 'package:flutter_music/utils/local_media_store.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalMediaRepository {
  static const String _indexKey = 'flutter_music_local_media_index_v1';

  static Future<String> mediaRootPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(dir.path, LocalMediaStore.rootFolderName);
  }

  static Future<String> resolvePlaybackPath({
    required LocalMediaType type,
    required String id,
    required String fallbackUrl,
  }) async {
    final item = await find(type: type, id: id);
    return LocalMediaStore.resolvePlaybackPath(
      id: id,
      type: type,
      fallbackUrl: fallbackUrl,
      item: item,
      fileExists: (path) => File(path).existsSync(),
    );
  }

  static Future<bool> hasLocal({
    required LocalMediaType type,
    required String id,
  }) async {
    final item = await find(type: type, id: id);
    return item != null && File(item.localPath).existsSync();
  }

  static Future<LocalMediaItem?> find({
    required LocalMediaType type,
    required String id,
  }) async {
    final index = await _readIndex();
    return index[LocalMediaStore.keyOf(type, id)];
  }

  static Future<LocalMediaItem> download({
    required LocalMediaType type,
    required String id,
    required String sourceUrl,
    String? title,
    ProgressCallback? onReceiveProgress,
  }) async {
    final rootPath = await mediaRootPath();
    final savePath = LocalMediaStore.buildLocalPath(
      rootPath: rootPath,
      type: type,
      id: id,
      sourceUrl: sourceUrl,
    );
    final file = File(savePath);
    await file.parent.create(recursive: true);

    if (!file.existsSync() || file.lengthSync() == 0) {
      final tempPath = '$savePath.download';
      await ServiceHelper.download(
        sourceUrl,
        tempPath,
        onReceiveProgress: onReceiveProgress,
      );
      final tempFile = File(tempPath);
      if (file.existsSync()) {
        await file.delete();
      }
      await tempFile.rename(savePath);
    }

    final stat = await file.stat();
    final item = LocalMediaItem(
      id: id,
      type: type,
      sourceUrl: sourceUrl,
      localPath: savePath,
      title: title,
      size: stat.size,
      updatedAt: DateTime.now(),
    );

    final index = await _readIndex();
    index[LocalMediaStore.keyOf(type, id)] = item;
    await _writeIndex(index);
    return item;
  }

  static Future<Map<String, LocalMediaItem>> _readIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalMediaStore.decodeIndex(prefs.getString(_indexKey));
  }

  static Future<void> _writeIndex(Map<String, LocalMediaItem> index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_indexKey, LocalMediaStore.encodeIndex(index));
  }
}
