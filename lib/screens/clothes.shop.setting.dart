import 'package:flutter/material.dart';

class ClothesShopSetting extends StatelessWidget {
  const ClothesShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
       Center(
        child: Column( 
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Container( 
              width: 300,
              height: 280,
              decoration: const BoxDecoration( 
                image: DecorationImage( 
                  image: AssetImage("/Users/bradigson/Desktop/Flutter/ClothesShop/clothes_shop/assets/images/sala-de-estar.png"),
                  fit: BoxFit.fill
                )
              ),
            ),

            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Register Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  )),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 237, 237), // Color de fondo cuando no está enfocado
                  borderRadius: BorderRadius.circular(30), // Redondea los bordes
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding:  EdgeInsets.fromLTRB(25, 10, 10, 10),
                    hintText: 'User Name',
                    border: InputBorder.none, // Elimina el borde
                  ),
                ),
              ),

              Container(
              margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 237, 237), // Color de fondo cuando no está enfocado
                  borderRadius: BorderRadius.circular(30), // Redondea los bordes
                ),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:  EdgeInsets.fromLTRB(25, 10, 10, 10),
                    hintText: 'Password',
                    border: InputBorder.none, // Elimina el borde
                  ),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
              width: 370,
              height: 55,
              child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 228, 156, 13)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ))),
                  child: const Text("SIGN UP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
            const SizedBox(height: 35),
             Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Container( 
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration( 
                        image: DecorationImage( 
                          image: AssetImage("/Users/bradigson/Desktop/Flutter/ClothesShop/clothes_shop/assets/images/google.png"),
                          fit: BoxFit.fill
                        )
                      ),
                ),
                const SizedBox(width: 30),
                Container( 
                width: 50,
                height: 50,
                decoration: const BoxDecoration( 
                      image: DecorationImage( 
                        image: AssetImage("/Users/bradigson/Desktop/Flutter/ClothesShop/clothes_shop/assets/images/facebook.png"),
                        fit: BoxFit.fill
                      )
                    ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
