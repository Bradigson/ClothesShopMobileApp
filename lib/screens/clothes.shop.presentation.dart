import 'package:flutter/material.dart';

class ClothesShopPresentation extends StatelessWidget {
  const ClothesShopPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/presentation_img.png"),
            const SizedBox(height: 40),
            const Text("Best furnitre in your home",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'VarelaRound')),
            const SizedBox(height: 10),
            const Text(
                "The best simple placce where you discover most wonderful furnitres and make your home beautiful",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 20,
                    color: Colors.black54)),
            const SizedBox(height: 60),
            SizedBox(
                width: 340,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 229, 147, 24)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ))),
                    child: const Text("Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'VarelaRound'))))
          ],
        ),
      ),
    );
  }
}
