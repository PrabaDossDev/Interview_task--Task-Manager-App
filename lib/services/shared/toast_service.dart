
import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../locator.dart';
import 'navigator_service.dart';

class ToastService {

  final NavigationService? _navigationService = locator<NavigationService>();

  showWidget({required Widget child}){
    return showToastWidget(
      child,
      context: _navigationService!.navigatorKey.currentContext,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.slideToBottom,
      position: StyledToastPosition.bottom,
      animDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      isIgnoring: false,
      reverseCurve: Curves.easeOut,);
  }

  showText({String? text}){
    return showToast(
      text,
      context: _navigationService!.navigatorKey.currentContext,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,);
  }

}