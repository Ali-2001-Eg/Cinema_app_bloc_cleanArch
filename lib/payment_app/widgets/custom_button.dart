import 'package:flutter/material.dart';

import '../components/colors.dart';


class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onTap;
  final bool? isBorder;

  const CustomButton(
      {Key? key,
        this.backgroundColor = const Color(0xff13273E),
      this.textColor=const Color(0xffE9EEF2),
      this.onTap,
      required this.text,
      this.isBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width-60,
        margin: const EdgeInsets.only(left: 30,right: 30),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColor.mainColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 40, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
