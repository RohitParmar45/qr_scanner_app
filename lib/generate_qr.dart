import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatelessWidget {
  final String
      pageName; // The name of the page you want to encode in the QR code

  GenerateQRPage({required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: pageName,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20.0),
            Text('Scan this QR code to navigate to $pageName'),
          ],
        ),
      ),
    );
  }
}
