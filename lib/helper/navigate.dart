import 'package:flutter/material.dart';

void goTo(BuildContext context, var newScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => newScreen));
}

dynamicHeight(BuildContext context, dynamic h) {
  return MediaQuery.of(context).size.height * h;
}

dynamicWidth(BuildContext context, dynamic w) {
  return MediaQuery.of(context).size.width * w;
}
