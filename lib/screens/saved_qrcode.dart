import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/services.dart';

class SavedQRcode extends StatefulWidget {
  SavedQRcode({Key key}) : super(key: key);

  @override
  _SavedQRcodeState createState() => _SavedQRcodeState();
}

class _SavedQRcodeState extends State<SavedQRcode> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getQrCodes(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data
                .map(
                  (qr) => Container(
                    margin: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 60.0,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(qr),
                            ),
                            TextButton(
                              onPressed: () {
                                Clipboard.setData(new ClipboardData(text: qr))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Copied to clipboard"),
                                    ),
                                  );
                                });
                              },
                              child: Icon(FontAwesome.copy),
                            ),
                            TextButton(
                              onPressed: () async {
                                List<String> newQrCodes = snapshot.data;
                                newQrCodes.remove(qr);
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setStringList('qr', newQrCodes);
                                setState(() {});
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                              ),
                              child: Icon(FontAwesome.trash),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<List<String>> _getQrCodes() async {
    final prefs = await SharedPreferences.getInstance();
    final qrCodes = prefs.getStringList('qr') ?? [];
    return qrCodes;
  }
}
