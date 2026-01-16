import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color:color,fontSize: size,fontWeight: fontWeight
    ),);
  }
}
