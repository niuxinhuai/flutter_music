import 'package:flutter/services.dart';
import 'package:flutter_music/utils/music_widget_bridge.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MusicWidgetTrack', () {
    test('serializes nullable metadata with safe defaults', () {
      final track = MusicWidgetTrack(
        id: '115162',
        title: '晴天',
        artist: null,
        artworkUrl: null,
        audioUrl: 'https://example.com/song.mp3',
      );

      expect(track.toMap(), {
        'id': '115162',
        'title': '晴天',
        'artist': '',
        'artworkUrl': '',
        'audioUrl': 'https://example.com/song.mp3',
      });
    });
  });

  group('MusicWidgetBridge', () {
    const channel = MethodChannel('flutter_music/music_widget');

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('sends track metadata before starting playback', () async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall call) async {
            calls.add(call);
            return null;
          });

      await MusicWidgetBridge.playTrack(
        MusicWidgetTrack(
          id: '115162',
          title: '晴天',
          artist: '周杰伦',
          artworkUrl: 'https://example.com/cover.jpg',
          audioUrl: 'https://example.com/song.mp3',
        ),
      );

      expect(calls, hasLength(1));
      expect(calls.single.method, 'playTrack');
      expect(calls.single.arguments, {
        'track': {
          'id': '115162',
          'title': '晴天',
          'artist': '周杰伦',
          'artworkUrl': 'https://example.com/cover.jpg',
          'audioUrl': 'https://example.com/song.mp3',
        },
      });
    });
  });
}
