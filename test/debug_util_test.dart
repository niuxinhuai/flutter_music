import 'package:flutter_music/utils/debug_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DebugUtils', () {
    test('uses mock data by default', () {
      expect(DebugUtils.debug, isTrue);
    });

    test('exposes the dart define key for mock data', () {
      expect(DebugUtils.mockDataEnvKey, 'USE_MOCK_DATA');
    });
  });
}
