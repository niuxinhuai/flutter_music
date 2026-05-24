import 'package:flutter_music/constants/url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlConstants', () {
    test('uses the bundled API host when no dart define is provided', () {
      expect(
        UrlConstants.baseUrl,
        'https://netease-cloud-music-api-sable-gamma.vercel.app',
      );
    });
  });

  group('MusicUri', () {
    test('builds the v1 song URL endpoint with a default quality level', () {
      expect(
        MusicUri.song_url('115162'),
        '/song/url/v1?id=115162&level=standard',
      );
    });

    test('builds the v1 song URL endpoint with a custom quality level', () {
      expect(
        MusicUri.song_url('115162', level: 'exhigh'),
        '/song/url/v1?id=115162&level=exhigh',
      );
    });
  });
}
