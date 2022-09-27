import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  int backgroundColor;
  int checkIConColor;
  bool isSelected = false;
  Function onClick;
  int colorIndex;
  ColorContainer(
      {super.key,
      required this.backgroundColor,
      required this.checkIConColor,
      required this.onClick,
      required this.colorIndex,
      this.isSelected = false});

  Widget getCheckIcon() {
    return Center(
      child: Icon(
        Icons.check,
        size: 28,
        color: Color(checkIConColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(colorIndex),
      child: Container(
        margin: const EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(backgroundColor),
        ),
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: isSelected ? getCheckIcon() : null,
      ),
    );
  }
}
