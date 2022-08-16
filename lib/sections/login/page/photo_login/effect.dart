import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/user.dart';
import 'package:flutter_music/models/simple_model.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/login/models/login.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<PhotoLoginState>? buildEffect() {
  return combineEffects(<Object, Effect<PhotoLoginState>>{
    PhotoLoginAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    PhotoLoginAction.onTapClear: _onTapClear,
    PhotoLoginAction.onTapSendCaptcha: _onTapSendCaptcha,
    PhotoLoginAction.onTapLogin: _onTapLogin,
  });
}

void _initState(Action action, Context<PhotoLoginState> ctx) {}

void _onTapClear(Action action, Context<PhotoLoginState> ctx) {
  ctx.state.emailController?.clear();
}

void _onTapSendCaptcha(Action action, Context<PhotoLoginState> ctx) async {
//  if (ctx.state.captchaText == "已发送") {
//    Toast.toast(ctx.context, "验证码已发送，请稍等");
//    return;
//  }
//  String? phone = ctx.state.photoController?.text;
//  if (phone != null) {
//    if (phone.length != 11) {
//      Toast.toast(ctx.context, "手机号码有误");
//      return;
//    }
//    VerifyPhoneModel phoneModel = await CommonService.verifyPhone(phone);
//    if (phoneModel.code != null && phoneModel.code == 200) {
//      ///手机号验证成功
//      SimpleModel simpleModel = await CommonService.sendCaptcha(phone);
//      if (simpleModel.code == 200) {
//        Toast.toast(ctx.context, "验证码发送成功");
//        ctx.state.captchaText = "已发送";
//        ctx.dispatch(PhotoLoginActionCreator.didRefreshAction());
//      } else {
//        Toast.toast(ctx.context, "验证码发送失败，请重试");
//      }
//    } else {
//      Toast.toast(ctx.context, "手机号验证失败");
//    }
//  }
}

void _onTapLogin(Action action, Context<PhotoLoginState> ctx) async {
  String? email = ctx.state.emailController?.text;
  String? password = ctx.state.passwordController?.text;
  if (email == null || password == null) {
    Toast.toast(ctx.context, "信息有误，请检查");
    return;
  }

  EmailLoginMode loginMode = await UserDefault.emailLogin(email, password);
  if (loginMode.code != 200) {
    Toast.toast(ctx.context, "登录数据有误");
  } else {
    ///登录成功
//    ARouter.close(ctx.context);
    Toast.toast(ctx.context, "登录成功");
  }
}

void _dispose(Action action, Context<PhotoLoginState> ctx) {
  ctx.state.emailController?.dispose();
  ctx.state.passwordController?.dispose();
}

void _onAction(Action action, Context<PhotoLoginState> ctx) {}
