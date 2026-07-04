import 'package:flutter_music/constants/url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlConstants', () {
    test('uses the bundled API host when no dart define is provided', () {
      expect(UrlConstants.baseUrl, 'https://music.163.com/api');
    });
  });

  group('MusicUri', () {
    test('builds the song player URL endpoint', () {
      expect(
        MusicUri.song_url('115162'),
        '/song/enhance/player/url?ids=%5B115162%5D&br=320000',
      );
    });

    test('builds the lyric endpoint with current query params', () {
      expect(
        MusicUri.song_lyric('115162'),
        '/song/lyric?id=115162&lv=-1&kv=-1&tv=-1',
      );
    });
  });
}
