import 'package:flutter/material.dart';
import 'package:wis/Mainpage.dart';
import 'package:wis/signup.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 60, 20, 100),
        width: 500,
        height: 500,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 100,
                //color: Colors.black,
                child: Center(
                  child: Text("Log in to MantayApps",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                width: 400,
                height: 300,
                //color: Colors.black,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        //color: Colors.black,
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22))),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: EdgeInsets.only(top: 10),
                        //color: Colors.black,
                        child: TextField(
                          controller: password,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22))),
                        ),
                      ),
                      Container(
                          width: 310,
                          height: 80,
                          padding: EdgeInsets.all(20),
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            child: Text("Login"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return mainpage();
                              }));
                            },
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 50),
                            child: Text("Create an account?"),
                          ),
                          Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 40),
                            child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                child: Text("Sign up"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signup()));
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
