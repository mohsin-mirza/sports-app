import 'package:flutter/material.dart';

class Progress {
  static MyCircular(BuildContext context, bool isLoading) {
    showDialog(
      context: context,
      builder: (_) => Visibility(
        visible: isLoading ? true : false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
