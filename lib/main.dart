import 'package:flutter/material.dart';
import 'package:qrscan/components/bottom_tab/bottom_tab_bar.dart';
import 'package:qrscan/screens/qr_code.dart';
import 'package:qrscan/screens/saved_qrcode.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey,
          minWidth: 20.0,
        ),
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  final pages = [QRScanPage(), SavedQRcode()];

  @override
  void initState() {
    super.initState();
  }

  _onTabChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _tabIndex == 0 ? Text("QR Code Scanner") : Text("Saved Item"),
      ),
      body: pages[_tabIndex],
      bottomNavigationBar: CustomBottomAppBar(
        onTabChanged: _onTabChanged,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () => Navigator.of(context).pop(),
      //   child: Icon(Icons.done_all),
      // ),
    );
  }
}
