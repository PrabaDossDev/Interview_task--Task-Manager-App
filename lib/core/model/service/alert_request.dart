import 'package:flutter/cupertino.dart';

class AlertRequest {
  final String? image;
  final String? title;
  final String? description;
  final Widget? content;
  final String? buttonTitle;
  final String? secondaryButtonTitle;
  final bool dismissable;
  final Function? onTap;

  final Widget? iconWidget;
  final Widget? contentWidget;
  final bool? showActionBar;
  final bool? showCloseIcon;
  final bool? isError;

  AlertRequest({
    this.image,
    this.title,
    this.description,
    this.content,
    this.buttonTitle,
    this.secondaryButtonTitle,
    this.dismissable = true,
    this.iconWidget,
    this.contentWidget,
    this.showActionBar,
    this.onTap,
    this.showCloseIcon,
    this.isError});

}

