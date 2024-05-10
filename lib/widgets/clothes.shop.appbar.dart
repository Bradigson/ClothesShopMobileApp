import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ClothesShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClothesShopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
  
  @override
  Widget build(BuildContext context) {
      void handleGoToCart() 
      {
        if(cart.isNotEmpty)
        {
          Navigator.pushNamed(context, '/cart');
        }
      }
    return AppBar(
      automaticallyImplyLeading: false,
      title:
       Row(
         children: [
           GestureDetector(
                onTap: handleGoToCart,
                child: badges.Badge(
                    badgeContent: Text(cart.length.toString(),
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    badgeStyle: const badges.BadgeStyle(
                        badgeColor: Color.fromARGB(255, 59, 158, 244)),
                    badgeAnimation: const badges.BadgeAnimation.scale(
                        toAnimate: true, animationDuration: Duration(seconds: 1)),
                    child:const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
              ),
         ],
       ), 
      // const Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Icon(Icons.shopping_cart_outlined)
      //     ],
      // ),
    );
  }
}
