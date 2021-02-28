import 'package:flutter/material.dart';
// import './login_otp.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: WillPopScope(
            onWillPop: () async {
              Future.value(false);
            },
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        // color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.house,
                              color: Colors.black,
                              size: 75,
                            ),
                            Text(
                              'Branch locator',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        // color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              color: Colors.black,
                              size: 75,
                            ),
                            Text(
                              'User Profile',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ))));
  }

  doStuff() {
    print('clicked@');
  }
}
