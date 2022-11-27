import 'package:flutter/material.dart';
import 'package:qrcode/Scanner.dart';

import 'generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[900],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              )
            ],
          ),
          // ignore: prefer_const_constructors
          centerTitle: true,
          title:  Text("QR Code Scanner"),
        ),
        body: TabBarView(children: [
          Generator(),
          // ignore: prefer_const_constructors
          Scanner(),
        ]),
      ),
    );
  }
}
