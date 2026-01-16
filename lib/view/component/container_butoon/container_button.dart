import 'package:flutter/material.dart';
class ContainerButton extends StatelessWidget {
  final String text;
  final Color?  color;
  final Color?  colortext;
  final double height;
  final double width;
  final double? size;
  final FontWeight? fontWeight;
  final BorderRadiusGeometry? radius;
  final Border? border;
  const ContainerButton({
    super.key ,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.colortext,
    this.border,
    this.radius,
    required this.width,
    required this.height

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: radius,
        color: color
      ),child: Center(child:Text(text,style: TextStyle(color:colortext,fontWeight: fontWeight,
    fontSize: size),),),
    );
  }
}
