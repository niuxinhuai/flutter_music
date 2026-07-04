import 'package:flutter/material.dart';
import 'package:flutter_music/utils/debug_util.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_music/main.dart';

void main() {
  testWidgets('App renders MaterialApp smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  }, skip: !DebugUtils.debug);
}
