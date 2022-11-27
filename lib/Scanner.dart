import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String? _qrInfo = 'Scan a QR Code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (camState == true) {
              setState(() {
                camState = false;
              });
            } else {
              setState(() {
                camState = true;
              });
            }
          },
          child: Icon(Icons.camera),
        ),
        body: camState
            ? Center(
                child: SizedBox(
                  height: 1000,
                  width: 500,
                  child: QRBarScannerCamera(qrCodeCallback: (code) {
                    qrCallback(code);
                  }),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code : " + _qrInfo!,
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ));
  }
}
