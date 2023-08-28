import 'package:flutter/material.dart';

class CustomFormTextFeild extends StatelessWidget {
  CustomFormTextFeild(
      {this.hintText, this.onChanged,this.inputType, this.obscureText = false});
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'feild is required';
          }
        },
        onChanged: onChanged,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(22),
            )),
      ),
    );
  }
}
