import 'package:flutter/material.dart';

import '../components/colors.dart';

class SizeText extends StatelessWidget {
  final String text;
  final Color color;

  const SizeText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return Container(
      child: Column(
        children: [
          Text(
            text,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: color, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              //divided by 5 means if the width is 50
              //i<5/50=10 means 10 dashes
              for (int i = 0; i < textSize.width / 5; i++)
                Container(
                  width: 5,
                  color: i.isEven ? color : Colors.white,
                  height: 2,
                )
            ],
          )
        ],
      ),
    );
  }

  //to get size of text
  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
