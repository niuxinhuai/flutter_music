import 'package:flutter/material.dart';
import 'package:flutter_music/res/theme.dart';
import 'package:flutter_music/sections/application/page/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      home: Builder(builder: (BuildContext context) {
        return ApplicationPage().buildPage({});
      }),
    );
  }
}
