import 'package:flutter/material.dart';
class TextformfieldCustom extends StatelessWidget {
final String text;
final Color? color;
final double width;
final double height;
final IconData? icon;
final Border? border;
final TextEditingController controller;
final BorderRadiusGeometry? radius;
   TextformfieldCustom({
     super.key,
     required this.text,
     required this.height,
     required this.width,
     this.icon,
     this.color,
     this.radius,
    required  this.controller,
     this.border
   });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
        border: border
      ),
      child: TextFormField(
        controller:controller ,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(icon),
          border: InputBorder.none
        ),
      ),
    );
  }
}
