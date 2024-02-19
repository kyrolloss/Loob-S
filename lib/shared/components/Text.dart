import 'package:flutter/material.dart';

class BuildText extends StatelessWidget{
  late String text;
  double? size ;
  Color? color;
  bool? bold;
  bool? center;
   int? maxLines;
   bool? overflow;
   bool? lineThrow;
   double? letterSpacing;
  double? wordSpacing;


  BuildText(
  {
    required this.text,

    this.color,
    this.size,
    this.bold,
    this.lineThrow,
    this.center,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing

}
      );



  @override
  Widget build(BuildContext context) {

    return Text(
      text ,
      overflow: overflow == null ? null : TextOverflow.ellipsis ,
      maxLines: maxLines == null ? null : maxLines,

      style: TextStyle(
        color: color,
        fontWeight: bold != null ? FontWeight.bold:null,
        decoration: lineThrow == null ?null : TextDecoration.lineThrough,
        fontSize: size,
          letterSpacing : letterSpacing,
        wordSpacing:wordSpacing,
      overflow: TextOverflow.ellipsis

      ),
      textAlign: center == null ? null : TextAlign.center  ,


    );
  }

}