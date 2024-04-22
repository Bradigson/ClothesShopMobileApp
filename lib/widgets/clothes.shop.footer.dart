import 'package:flutter/material.dart';

class ClothesShopFooter extends StatefulWidget {
  const ClothesShopFooter({super.key});

  @override
  State<ClothesShopFooter> createState() => _ClothesShopFooter();
}

class _ClothesShopFooter extends State<ClothesShopFooter> {
  int _selectedIndex = 0;

  //@override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
          fontSize: 11), // Tamaño de fuente para la etiqueta seleccionada
      unselectedLabelStyle: const TextStyle(fontSize: 10), //cuando seleciones
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: ''),
      ],
    );
  }
}
