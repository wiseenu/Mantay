import 'package:flutter/material.dart';
import 'package:wis/Barcode.dart';
import 'package:wis/History.dart';
import 'package:wis/Model.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70),
                width: 300,
                height: 120,
                //color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Wellcome",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "To",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "MantayApps",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 100,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                    child: Text(
                      "Ukuran",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => model()));
                    }),
              ),
              Container(
                width: 300,
                height: 100,
                color: Colors.black,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                    child: Text(
                      "Scan Barcode",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => barcode()));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
