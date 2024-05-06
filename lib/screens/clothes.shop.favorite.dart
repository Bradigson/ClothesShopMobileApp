import 'package:flutter/material.dart';

class ClothesShopFavorite extends StatefulWidget {
  const ClothesShopFavorite({super.key});
  @override
  State<ClothesShopFavorite> createState() => _ClothesShopFavorite();
}

class _ClothesShopFavorite extends State<ClothesShopFavorite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Favorite")],
      ),
    );
  }
}
