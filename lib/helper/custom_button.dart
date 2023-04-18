import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onPress;
  const CustomButton(this.hintText, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.red,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Text(
            hintText ?? 'hint Text...',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          )),
        ),
      ),
    );
  }
}
