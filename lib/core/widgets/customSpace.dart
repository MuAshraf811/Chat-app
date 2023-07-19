import 'package:flutter/material.dart';

class CustomSpace extends StatelessWidget {
  final double height;
  final double width;
  const CustomSpace({super.key , required this.height , required this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height, 
      width: width,
    );
  }
}
