import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<T> showSaveDialog<T>(BuildContext context, String displayText) {
  void saveQRCode() async {
    final prefs = await SharedPreferences.getInstance();
    final qrCodes = prefs.getStringList('qr') ?? [];

    qrCodes.add(displayText);

    prefs.setStringList('qr', qrCodes);
  }

  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(displayText),
              SizedBox(height: 10),
              Text('Would you like to save it?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Save'),
            onPressed: () {
              saveQRCode();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
