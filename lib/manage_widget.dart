import 'package:flutter/material.dart';

class ManageWidget extends StatefulWidget {
  const ManageWidget({super.key});

  @override
  _ManageWidgetState createState() => _ManageWidgetState();
}

class _ManageWidgetState extends State<ManageWidget> {
  bool _isVisible = true;
  int _selectedIndex = 0;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeBoxColor() {
    setState(() {
      // Ganti warna box secara random (contoh manual)
      boxColor = boxColor == Colors.blue ? Colors.purple : Colors.blue;
    });
  }

  Color boxColor = Colors.blue;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Akhir - Gabungan Widget'),
        backgroundColor: Colors.teal,
      ),
      body: _buildBodyContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBodyContent() {
    if (_selectedIndex == 0) {
      // Tampilan Home
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: 250,
                height: 150,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Box Model\n(Animated!)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _toggleVisibility,
              icon: const Icon(Icons.visibility),
              label: Text(_isVisible ? 'Sembunyikan Box' : 'Tampilkan Box'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _changeBoxColor,
              icon: const Icon(Icons.color_lens),
              label: const Text('Ganti Warna Box'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      );
    } else {
      // Tampilan Pengaturan
      return const Center(
        child: Text(
          'Halaman Pengaturan',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    }
  }
}
