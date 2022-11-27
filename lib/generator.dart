import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class Generator extends StatefulWidget {
  const Generator({super.key});

  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  var code = '';
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Enter text"),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.indigo,
                // const SizedBox(20),
                onPressed: () {
                  setState(() {
                    code = title.text;
                  });
                },

                // ignore: prefer_const_constructors
                child: Text(
                  "Generate",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              code == ' '
                  ? Text('')
                  : BarcodeWidget(
                      data: '$code',
                      barcode: Barcode.qrCode(
                          errorCorrectLevel: BarcodeQRCorrectionLevel.high),
                      width: 200,
                      height: 200,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
