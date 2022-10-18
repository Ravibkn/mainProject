// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:courierv9/pages/style_constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'colors_constent.dart';
import 'components/custom_button.dart';

class ScanAwb extends StatefulWidget {
  const ScanAwb({Key? key}) : super(key: key);

  @override
  State<ScanAwb> createState() => _ScanAwbState();
}

class _ScanAwbState extends State<ScanAwb> {
  String _data = "0";
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mThemeColor,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text("Scan AWB", style: mTextStyleHeader),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Scan Awb Barcode",
              onTap: () => _scan(),
            ),
            Text(_data),
          ],
        ),
      ),
    );
  }
}
