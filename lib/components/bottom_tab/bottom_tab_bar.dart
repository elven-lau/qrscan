import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/components/bottom_tab/bottom_tab_item.dart';

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabChanged;

  CustomBottomAppBar({Key key, this.onTabChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;
  final Color _color = Colors.black;
  final Color _selectedColor = Colors.red;

  _onTabMenuItem(int index) {
    widget.onTabChanged(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
      ),
      child: BottomAppBar(
        color: Colors.white,
        // notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        elevation: 10.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomBottomTabItem(
              index: 0,
              selectedIndex: _selectedIndex,
              color: _color,
              selectedColor: _selectedColor,
              iconData: FontAwesome.qrcode,
              iconText: "QR Scan",
              onPressed: _onTabMenuItem,
            ),
            CustomBottomTabItem(
              index: 1,
              selectedIndex: _selectedIndex,
              color: _color,
              selectedColor: _selectedColor,
              iconData: FontAwesome.folder,
              iconText: "Saved Items",
              onPressed: _onTabMenuItem,
            ),
          ],
        ),
      ),
    );
  }
}
