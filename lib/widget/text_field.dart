import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final bool isVisible;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
       this.isVisible=false,
       required this.controller,
      this.suffixIcon,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        obscureText: isVisible,
        autovalidateMode: AutovalidateMode.always,
        validator: validator,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon:  suffixIcon,
            labelText: hintText,
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.red)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.green)),
            fillColor: Colors.white54,
            filled: true),
      ),
    );
  }
}
