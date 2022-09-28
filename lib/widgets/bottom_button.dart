import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onClick,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);
  final String text;
  final VoidCallback onClick;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backgroundColor),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
