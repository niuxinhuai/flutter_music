import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class PhotoLoginState implements Cloneable<PhotoLoginState> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  PhotoLoginState clone() {
    return PhotoLoginState()
      ..emailController = emailController
      ..passwordController = passwordController;
  }
}

PhotoLoginState initState(Map<String, dynamic>? args) {
  return PhotoLoginState()
    ..emailController = TextEditingController()
    ..passwordController = TextEditingController();
}
