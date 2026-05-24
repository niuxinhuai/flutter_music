import 'package:flutter/services.dart';

class MusicWidgetTrack {
  const MusicWidgetTrack({
    required this.id,
    required this.title,
    required this.audioUrl,
    this.artist,
    this.artworkUrl,
  });

  final String id;
  final String title;
  final String? artist;
  final String? artworkUrl;
  final String audioUrl;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist ?? '',
      'artworkUrl': artworkUrl ?? '',
      'audioUrl': audioUrl,
    };
  }
}

class MusicWidgetSnapshot {
  const MusicWidgetSnapshot({
    required this.isPlaying,
    required this.position,
    required this.duration,
  });

  final bool isPlaying;
  final Duration position;
  final Duration duration;

  factory MusicWidgetSnapshot.fromMap(Map<dynamic, dynamic>? map) {
    return MusicWidgetSnapshot(
      isPlaying: map?['isPlaying'] == true,
      position: Duration(milliseconds: (map?['position'] as int?) ?? 0),
      duration: Duration(milliseconds: (map?['duration'] as int?) ?? 0),
    );
  }
}

class MusicWidgetBridge {
  static const MethodChannel _channel = MethodChannel(
    'flutter_music/music_widget',
  );

  static Future<void> playTrack(MusicWidgetTrack track) {
    return _channel.invokeMethod<void>('playTrack', {'track': track.toMap()});
  }

  static Future<void> pause() {
    return _channel.invokeMethod<void>('pause');
  }

  static Future<void> resume() {
    return _channel.invokeMethod<void>('resume');
  }

  static Future<void> stop() {
    return _channel.invokeMethod<void>('stop');
  }

  static Future<void> next() {
    return _channel.invokeMethod<void>('next');
  }

  static Future<void> previous() {
    return _channel.invokeMethod<void>('previous');
  }

  static Future<MusicWidgetSnapshot> getSnapshot() async {
    final result = await _channel.invokeMapMethod<dynamic, dynamic>(
      'getSnapshot',
    );
    return MusicWidgetSnapshot.fromMap(result);
  }
}
