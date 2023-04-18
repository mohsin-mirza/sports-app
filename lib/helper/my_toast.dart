import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class MyMptionToast {
  static success(BuildContext context, des, title) {
    MotionToast.success(
      title: title,
      description: des,
      animationType: AnimationType.fromLeft,
    ).show(context);
  }
}
