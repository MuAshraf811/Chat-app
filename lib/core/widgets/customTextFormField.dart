import 'package:chat/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscure;
  final String hint;
  final IconData suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  const CustomTextFormField(
      {super.key,
      required this.keyboardType,
      required this.obscure,
      required this.hint,
      required this.suffixIcon,
      this.controller,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: obscure,
      keyboardType:keyboardType ,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(),
          contentPadding: const EdgeInsets.only(left: 12),
          suffixIcon: Icon(suffixIcon),
          suffixIconColor: kAppColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            borderSide: BorderSide(
              color: kAppColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            borderSide: BorderSide(
              color: kAppColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kAppColor,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          )),
    );
  }
}
