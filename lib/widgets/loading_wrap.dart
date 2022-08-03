import 'package:flutter/material.dart' hide Action;

import 'error.dart';
import 'loading.dart';

///请求接口时可以显示loading或者error

enum LoadingState { isLoading, success, error }

class LoadingWrap extends StatelessWidget {
  ///当前状态
  final LoadingState? loadingState;
  final Builder? loadingChild;
  final Builder successChild;
  final Builder? errorChild;
  final bool showBackOnError;

  ///显示errorChild时点击屏幕事件
  final VoidCallback? onErrorTap;

  const LoadingWrap(
      {required this.loadingState,
      required this.successChild,
      this.loadingChild,
      this.errorChild,
      this.onErrorTap,
      this.showBackOnError = false});

  @override
  Widget build(BuildContext context) {
    if (loadingState == LoadingState.isLoading) {
      return loadingChild?.build(context) ?? Loading();
    } else if (loadingState == LoadingState.success) {
      return successChild.build(context);
    } else if (loadingState == LoadingState.error) {
      return errorChild?.build(context) ??
          GpErrorWidget(
            onTap: onErrorTap,
            showBackOnError: showBackOnError,
          );
    } else {
      return Container();
    }
  }
}
