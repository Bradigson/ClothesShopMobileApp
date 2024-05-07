import 'package:clothes_shop/screens/clothes.shop.presentation.dart';
import 'package:clothes_shop/screens/clothes.shop.screen.dart';
import 'package:clothes_shop/screens/clothes.shop.view.products.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()async  
{
 // await dotenv.load(fileName: ".env");
  runApp(const ClothesShopApplication());
}

class ClothesShopApplication extends StatelessWidget {
  const ClothesShopApplication({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return  MaterialApp
    (
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> const ClothesShopPresentation(),
        '/home':(context)=> const ClothesShopScreen(),
        '/view':(context)=> const ClothesShoppViewProdusct()
      },
      
    );
    
  }
}
