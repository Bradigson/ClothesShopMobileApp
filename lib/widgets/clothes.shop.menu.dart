import 'package:clothes_shop/services/home.icons.dart';
import 'package:flutter/material.dart';

class ClothesShopMenus extends StatelessWidget {
  const ClothesShopMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView.builder(
        //padding: EdgeInsets.zero,
        itemCount: iconsTabBarHome.length,
        itemBuilder: (context, index) 
        {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              ListTile(
                leading: Image.asset("assets/images/${iconsTabBarHome[index].url}",
                scale: 2,),
                title:  Text(iconsTabBarHome[index].name),
                onTap: () {},
              )
            ],
          );
        },
      ),
    );
  }
}
