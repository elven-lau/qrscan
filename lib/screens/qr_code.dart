import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrscan/components/save_dialog.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Scan QR code"),
            onPressed: barcodeScanning,
          ),
        ],
      ),
    );
  }

  Future barcodeScanning() async {
    try {
      ScanResult result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        showSaveDialog(context, result.rawContent);
      }
    } catch (e) {
      print(e);
    }
  }
}
