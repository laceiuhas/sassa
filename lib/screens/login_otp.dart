import 'package:flutter/material.dart';
import './mainscreen.dart';

class LoginScreenOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'OTP', labelText: 'Enter your OTP'),
              ),
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
    );
  }

  doStuff() {
    print('Clicked**');
  }
}
