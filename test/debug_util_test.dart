import 'package:flutter_music/utils/debug_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DebugUtils', () {
    test('uses real API data by default', () {
      expect(DebugUtils.debug, isFalse);
    });

    test('exposes the dart define key for mock data', () {
      expect(DebugUtils.mockDataEnvKey, 'USE_MOCK_DATA');
    });
  });
}
