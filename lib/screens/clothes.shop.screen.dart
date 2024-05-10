import 'package:clothes_shop/screens/clothes.shop.favorite.dart';
import 'package:clothes_shop/screens/clothes.shop.home.dart';
import 'package:clothes_shop/screens/clothes.shop.new.products.dart';
import 'package:clothes_shop/widgets/clothes.shop.appbar.dart';
import 'package:clothes_shop/widgets/clothes.shop.menu.dart';
import 'package:flutter/material.dart';

class ClothesShopScreen extends StatefulWidget {
  const ClothesShopScreen({super.key});
  @override
  State<ClothesShopScreen> createState() => _ClothesShopScreen();
}

class _ClothesShopScreen extends State<ClothesShopScreen> {
  int _selectedIndex = 0;

  final routes = [
    const ClothesShopHome(),
    const ClothesShopFavorite(),
    const ClothesShopNewProducts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index < 3) {
        _selectedIndex = index;
      } else {
        Navigator.pushNamed(context, '/setting');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClothesShopAppBar(),
      endDrawer: const ClothesShopMenus(),
      body: routes[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: ''),
        ],
      ),
    );
  }
}
