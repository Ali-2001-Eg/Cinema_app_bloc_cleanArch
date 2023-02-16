import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final double? fontSize;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  final double? iconSize;

  const MenuButton(
      {Key? key,
      required this.icon,
      this.text,
      this.fontSize=20,
      this.onTap,
      this.backgroundColor=const Color(0xff13273E),
      this.iconColor= Colors.white,
      this.textColor=const Color(0xff13273E),
      this.iconSize=36,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor
            ),
            child: Icon(icon,size: iconSize,color: iconColor,),
          ),
          (text!=null)?Text(text!,style: TextStyle(fontSize: 14,color: textColor),):Container(),
        ],
      ),
    );
  }
}
