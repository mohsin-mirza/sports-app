import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class MyMotionToast {
  static success(BuildContext context, des, title) {
    return MotionToast.success(
      description: des,
      animationType: AnimationType.fromLeft,
      title: title,
      width: 300,
    ).show(context);
  }
  // static success(BuildContext context, title, desc) {
  //   return MotionToast.success(
  //     title: title,
  //     description: desc,
  //     width: 300,
  //     animationType: ANIMATION.fromLeft,
  //   ).show(context);
}
