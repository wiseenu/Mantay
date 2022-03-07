import 'package:flutter/material.dart';

class barcode extends StatefulWidget {
  const barcode({Key? key}) : super(key: key);

  @override
  _barcodeState createState() => _barcodeState();
}

class _barcodeState extends State<barcode> {
  String code = "";
  String GetCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Barcode Soon"),
      ),
      /* body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                  child: Text("Scan"),
                  onPressed: () {
                    scanbarcode();
                  }),
              Text(code),
            ],
          ),*/
    );
  }
}
