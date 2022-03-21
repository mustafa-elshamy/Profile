import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle textStyle;

  const CustomText(
      {Key key,
      @required this.text,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: Text(
        text,
        style: textStyle ?? const TextStyle(),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
      ),
    );
  }
}
