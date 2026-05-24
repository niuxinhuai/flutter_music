import 'package:flutter_music/utils/local_media_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalMediaStore', () {
    test('serializes media items for persistent download index', () {
      final item = LocalMediaItem(
        id: '115162',
        type: LocalMediaType.audio,
        sourceUrl: 'https://example.com/song.mp3',
        localPath: '/tmp/flutter_music_media/audio/115162.mp3',
        title: '晴天',
        size: 1024,
        updatedAt: DateTime.utc(2026, 5, 24),
      );

      final restored = LocalMediaItem.fromJson(item.toJson());

      expect(restored.id, '115162');
      expect(restored.type, LocalMediaType.audio);
      expect(restored.sourceUrl, 'https://example.com/song.mp3');
      expect(restored.localPath, '/tmp/flutter_music_media/audio/115162.mp3');
      expect(restored.title, '晴天');
      expect(restored.size, 1024);
      expect(restored.updatedAt, DateTime.utc(2026, 5, 24));
    });

    test('builds stable safe file paths from id and url extension', () {
      final path = LocalMediaStore.buildLocalPath(
        rootPath: '/tmp/media',
        type: LocalMediaType.video,
        id: 'D52/DA5 A9',
        sourceUrl: 'https://example.com/video.mp4?token=abc',
      );

      expect(path, '/tmp/media/video/D52_DA5_A9.mp4');
    });

    test('resolves an existing local item before network url', () {
      final item = LocalMediaItem(
        id: '115162',
        type: LocalMediaType.audio,
        sourceUrl: 'https://example.com/song.mp3',
        localPath: '/tmp/song.mp3',
        updatedAt: DateTime.utc(2026, 5, 24),
      );

      final resolved = LocalMediaStore.resolvePlaybackPath(
        id: '115162',
        type: LocalMediaType.audio,
        fallbackUrl: item.sourceUrl,
        item: item,
        fileExists: (_) => true,
      );

      expect(resolved, '/tmp/song.mp3');
    });
  });
}
