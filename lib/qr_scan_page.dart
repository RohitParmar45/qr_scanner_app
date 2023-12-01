import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isNavigationTriggered = false; // Flag to track navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add code to open the camera scanner
          controller?.toggleFlash();
          controller?.flipCamera();
        },
        tooltip: 'Toggle Flash',
        child: Icon(Icons.flash_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData != null && !isNavigationTriggered) {
        isNavigationTriggered =
            true; // Set the flag to true to prevent multiple navigations
        _handleScannedData(scanData.code);
      }
    });
  }

  void _handleScannedData(String? data) {
    // Add logic to handle the scanned data and navigate to the corresponding page
    switch (data) {
      case 'PageA':
        Navigator.pushNamed(context, '/pageA');
        break;
      case 'PageB':
        Navigator.pushNamed(context, '/pageB');
        break;
      case 'PageC':
        Navigator.pushNamed(context, '/pageC');
        break;
      default:
        // Handle unknown QR code data
        break;
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
