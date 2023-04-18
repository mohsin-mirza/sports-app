import 'package:flutter/material.dart';

Future<void> myDialoge(BuildContext context, var error) async {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            '$error',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      });
}
