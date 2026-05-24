import 'dart:convert';

import 'package:path/path.dart' as p;

enum LocalMediaType { audio, video }

class LocalMediaItem {
  LocalMediaItem({
    required this.id,
    required this.type,
    required this.sourceUrl,
    required this.localPath,
    this.title,
    this.size,
    required this.updatedAt,
  });

  final String id;
  final LocalMediaType type;
  final String sourceUrl;
  final String localPath;
  final String? title;
  final int? size;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'sourceUrl': sourceUrl,
      'localPath': localPath,
      'title': title,
      'size': size,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory LocalMediaItem.fromJson(Map<String, dynamic> json) {
    return LocalMediaItem(
      id: json['id'] as String,
      type: LocalMediaType.values.firstWhere(
        (type) => type.name == json['type'],
        orElse: () => LocalMediaType.audio,
      ),
      sourceUrl: json['sourceUrl'] as String,
      localPath: json['localPath'] as String,
      title: json['title'] as String?,
      size: json['size'] as int?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

class LocalMediaStore {
  static const String rootFolderName = 'flutter_music_media';

  static String keyOf(LocalMediaType type, String id) => '${type.name}:$id';

  static String buildLocalPath({
    required String rootPath,
    required LocalMediaType type,
    required String id,
    required String sourceUrl,
  }) {
    final safeName = _safeFileName(id);
    final extension = _extensionFromUrl(sourceUrl, type);
    return p.join(rootPath, type.name, '$safeName$extension');
  }

  static String resolvePlaybackPath({
    required String id,
    required LocalMediaType type,
    required String fallbackUrl,
    required LocalMediaItem? item,
    required bool Function(String path) fileExists,
  }) {
    if (item != null &&
        item.id == id &&
        item.type == type &&
        fileExists(item.localPath)) {
      return item.localPath;
    }
    return fallbackUrl;
  }

  static Map<String, LocalMediaItem> decodeIndex(String? rawJson) {
    if (rawJson == null || rawJson.isEmpty) {
      return {};
    }
    final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
    return decoded.map(
      (key, value) => MapEntry(
        key,
        LocalMediaItem.fromJson(Map<String, dynamic>.from(value as Map)),
      ),
    );
  }

  static String encodeIndex(Map<String, LocalMediaItem> index) {
    return jsonEncode(index.map((key, value) => MapEntry(key, value.toJson())));
  }

  static bool isLocalPath(String path) {
    final uri = Uri.tryParse(path);
    if (uri == null) {
      return true;
    }
    return !uri.hasScheme || uri.scheme == 'file';
  }

  static String _safeFileName(String id) {
    final safe = id.replaceAll(RegExp(r'[^a-zA-Z0-9._-]+'), '_');
    return safe.replaceAll(RegExp(r'^_+|_+$'), '').isEmpty ? 'media' : safe;
  }

  static String _extensionFromUrl(String sourceUrl, LocalMediaType type) {
    final uri = Uri.tryParse(sourceUrl);
    final path = uri?.path ?? sourceUrl;
    final extension = p.extension(path).toLowerCase();
    if (extension.length > 1 && extension.length <= 8) {
      return extension;
    }
    return type == LocalMediaType.audio ? '.mp3' : '.mp4';
  }
}
