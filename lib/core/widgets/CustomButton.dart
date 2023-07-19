import 'package:chat/core/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String label;
  const CustomButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(9)),
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        )),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: kAppColor,
            width: 1,
          ),
        ),
      ),
      label: Text(label),
      icon: Icon(icon),
    );
  }
}
