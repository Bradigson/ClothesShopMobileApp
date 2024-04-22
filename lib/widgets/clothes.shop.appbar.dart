import 'package:flutter/material.dart';

class ClothesShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClothesShopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.shopping_cart_outlined)
          ],
      ),
    );
  }
}
