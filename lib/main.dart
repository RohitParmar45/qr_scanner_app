import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/generate_qr.dart';
import 'package:qr_scanner_app/qr_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/pageA': (context) => PageA(),
        '/pageB': (context) => PageB(),
        '/pageC': (context) => PageC(),
        '/QRScanPage': (context) => QRScanPage(),
        '/generateQrPage': (context) => GenerateQRPage(pageName: "PageC"),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pageA');
              },
              child: const Text('Go to Page A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pageB');
              },
              child: const Text('Go to Page B'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pageC');
              },
              child: Text('Go to Page C'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/QRScanPage');
              },
              child: const Text('Go to QR Scan Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/generateQrPage');
              },
              child: Text('Generate QR'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: Text('This is Page A'),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Center(
        child: Text('This is Page B'),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page C'),
      ),
      body: Center(
        child: Text('This is Page C'),
      ),
    );
  }
}
