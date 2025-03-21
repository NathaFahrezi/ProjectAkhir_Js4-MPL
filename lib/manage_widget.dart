import 'package:flutter/material.dart';

class ManageWidget extends StatefulWidget {
  const ManageWidget({super.key});

  @override
  _ManageWidgetState createState() => _ManageWidgetState();
}

class _ManageWidgetState extends State<ManageWidget> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Akhir - Gabungan Widget'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 250,
                height: 150,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 30,
                  right: 30,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Box Model\n(Animated!)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: Text(_isVisible ? 'Sembunyikan Box' : 'Tampilkan Box'),
            ),
          ],
        ),
      ),
    );
  }
}
