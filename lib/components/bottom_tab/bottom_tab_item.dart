import 'package:flutter/material.dart';

class CustomBottomTabItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Color color;
  final Color selectedColor;
  final IconData iconData;
  final String iconText;
  final ValueChanged<int> onPressed;

  CustomBottomTabItem({
    Key key,
    this.index,
    this.selectedIndex,
    this.color,
    this.selectedColor,
    this.iconData,
    this.iconText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color showColor = selectedIndex == index ? selectedColor : color;
    return Expanded(
      child: SizedBox(
        height: 60.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: showColor,
                ),
                Text(
                  iconText,
                  style: TextStyle(
                    color: showColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
