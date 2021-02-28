import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './mainscreen.dart';

Future<http.Response> checkIDNO(String OTP) async {
  Map data = {'code': OTP};
  String url = 'https://ironbar-303808.uc.r.appspot.com/findCode';

  String theBody = json.encode(data);
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

class LoginScreenOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'OTP', labelText: 'Enter your OTP'),
              ),
            ),
            Container(
              height: 50,
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                doStuff();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }),
                );
              },
              child: Text(
                'Submit',
              ),
            ),
          ],
        ),
      ),
    ));
  }

  doStuff() {
    print('Clicked**');
  }
}
