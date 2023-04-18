import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final String? Function(String)? onChange;
  final bool? prefixcon;
  final Widget? icon;
  final bool isPassword;
  final TextInputType? keyboard;

  CustomTextField({
    this.hintText,
    this.controller,
    this.prefixcon = false,
    this.validate,
    this.keyboard,
    this.onChange,
    this.isPassword = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChange,
        style: TextStyle(fontSize: 15),

        keyboardType: keyboard ?? TextInputType.text,
        textInputAction: TextInputAction.done,

        controller: controller,
        validator: validate,
        obscureText: isPassword == false ? false : isPassword,

        //decoration
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.green),
          ),

          //border radius
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Colors.red),
          ),

          suffixIcon: icon ?? Icon(Icons.sports),
        ),
      ),
    );
  }
}
