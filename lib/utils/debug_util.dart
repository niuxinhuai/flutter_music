class DebugUtils {
  static const String mockDataEnvKey = 'USE_MOCK_DATA';
  static const bool debug = bool.fromEnvironment(
    mockDataEnvKey,
    defaultValue: true,
  );
}
