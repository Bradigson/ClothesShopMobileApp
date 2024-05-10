import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ClothesShopCart extends StatefulWidget {
  const ClothesShopCart({super.key});

  @override
  State<ClothesShopCart> createState() => _ClothesShopCart();
}

class _ClothesShopCart extends State<ClothesShopCart> {
  int totelToPay = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalToPay();
  }

  void calculateTotalToPay() {
    if (cart.isNotEmpty) {
      // Utiliza isNotEmpty para verificar si el carrito tiene elementos
      cart.forEach((item) {
        try {
          double price = double.parse(item.price);
          int intPrice = price.round();
          totelToPay += intPrice;
        } catch (e) {
          //print("Error al convertir el precio: $e"); // Manejo de errores
        }
      });
    } else {
      //print("no data");
    }
  }

  void handleBuyProducts() {
    setState(() {
      cart.clear();
      totelToPay = 0;
      Navigator.pushNamed(context, '/home');
    });
  }

  void handleDeleteFromCart(dynamic id) {
    setState(() {
      cart.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 5),
            const Text("Total  : \$ ", style: TextStyle(fontSize: 15)),
            Text("$totelToPay .00",
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            const SizedBox(width: 30),
            const Text("Products Amount :  ", style: TextStyle(fontSize: 15)),
            Text(cart.length.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 63, 160, 239),
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 15),
            height: 75,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(137, 214, 214, 214),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(cart[index].image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(cart[index].name),
              trailing: GestureDetector(
                  onTap: () => handleDeleteFromCart(cart[index]),
                  child: const Icon(Icons.delete_outline, color: Colors.red)),
            ),
          );
        },
      ),
      bottomNavigationBar: cart.length > 0
          ? BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 340,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          buttonsBorderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          dismissOnTouchOutside: true,
                          dismissOnBackKeyPress: false,
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          desc:
                              'Confirm if you are ready to make your purchase.',
                          showCloseIcon: true,
                          btnCancelOnPress: () {},
                          btnOkOnPress: handleBuyProducts,
                        ).show();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.amber),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                            ),
                          )),
                      child: const Text("Buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  )
                ],
              ),
            )
          : null,
    );
  }
}
