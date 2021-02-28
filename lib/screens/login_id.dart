import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './login_otp.dart';

Future<http.Response> checkIDNO(String userID) async {
  Map data = {'ID': userID};
  String url = 'https://ironbar-303808.uc.r.appspot.com/findID';

  var theBody = json.encode(data);
  String msg = '';

  http.post(url, body: data).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      var msgObj = json.decode(response.body);
      msg = msgObj["message"];
      print('correct msg?? : $msg');
    }
    return response;
  });

  // return response;
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String idNo = '';
  String errMsg = '';
  bool idFound = false;

  void checkID(String idNo) {
    print('ID: $idNo');

    checkIDNO(idNo);
    setState(() {
      idFound = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          Future.value(false);
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Image(
                    image: AssetImage('assets/logoSassa.jpg'),
                  )),
              Container(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'ID No.', labelText: 'Enter your ID No.'),
                  onChanged: (text) {
                    idNo = text;
                  },
                ),
              ),
              Container(height: 20),
              FlatButton(
                color: Colors.amber,
                onPressed: () {
                  checkID(idNo);
                  if (idFound) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreenOTP();
                      }),
                    );
                  } else {
                    setState(() {
                      errMsg = 'ID Not Found';
                    });
                  }
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text('$errMsg')
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String response;

  User({this.id, this.response});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      response: json['message'],
    );
  }
}
