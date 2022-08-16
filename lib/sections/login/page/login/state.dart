import 'package:fish_redux/fish_redux.dart';

class LoginState implements Cloneable<LoginState> {
  List<String> assets = [];

  @override
  LoginState clone() {
    return LoginState()..assets = assets;
  }
}

LoginState initState(Map<String, dynamic>? args) {
  return LoginState()
    ..assets = [
      "cm6_login_logo_wechat~iphone.png",
      "cm6_login_logo_qq~iphone.png",
      "cm6_login_logo_weibo~iphone.png",
      "cm6_login_logo_apple~iphone.png",
      "cm6_login_logo_netease~iphone.png"
    ];
}
