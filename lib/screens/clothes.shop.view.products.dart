import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:clothes_shop/services/clothes.shop.service.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';

class ClothesShoppViewProdusct extends StatefulWidget {
  const ClothesShoppViewProdusct({super.key});

  @override
  State<ClothesShoppViewProdusct> createState() => _ClothesShoppViewProdusct();
}

class _ClothesShoppViewProdusct extends State<ClothesShoppViewProdusct> {
  List<ClothesShopModelLivingRoom>? livingRoom;
  List<ClothesShopModelLivingRoom>? displayedAllLivingRoomProducts = [];
  var isLoading = false;
  int count = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    livingRoom = await fetchLivinRoom();
    displayedAllLivingRoomProducts = await fetchLivinRoom();
    if (livingRoom != null) {
      setState(() {
        isLoading = true;
      });
    } else {
      print("no data Yet");
    }
  }

  //amount of products
  handleAdd() {
    if (count < 50) {
      setState(() {
        count++;
      });
    }
  }

  handleRemove() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  void handleAddToCart(dynamic product) {
    setState(() {
      if (cart.length < 20) {
        cart.add(product);
      }
    });
  }

  void handleGoToCart() {
    if(cart.isNotEmpty)
    {
      Navigator.pushNamed(context, '/cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    final parametro = ModalRoute.of(context)?.settings.arguments as int;

    if (
        displayedAllLivingRoomProducts == null ||
        parametro < 0 ||
        parametro >= displayedAllLivingRoomProducts!.length) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 229, 147, 24)),
          ),
        ),
      );
    }

    final filter = displayedAllLivingRoomProducts![parametro];

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        actions: [
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
          const SizedBox(width: 25),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(cart.isNotEmpty ?   Icons.add_shopping_cart  : Icons.shopping_cart_outlined,
          //   color: cart.isNotEmpty ? Colors.amber : null))
        ],
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          String img = filter.image;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 370,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(filter.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'VarelaRound')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${filter.price}",
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'VarelaRound')),
                    Row(
                      children: [
                        SizedBox(
                          width: 45,
                          height: 38,
                          child: IconButton(
                            onPressed: handleAdd,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 228, 228, 228)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 30,
                          color: null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(count.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 45,
                          height: 38,
                          child: IconButton(
                            onPressed: handleRemove,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 228, 228, 228)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 8),
                    Text(filter.star,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    const Text("(50 reviews)")
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                    'Este elegante sofá seccional moderno es el centro perfecto para tu sala de estar.' +
                        'Con su diseño contemporáneo y líneas limpias, combina perfectamente con cualquier estilo de decoración.',
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 50,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_outline,
                          color: Colors.black,
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 228, 228, 228)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 275,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => handleAddToCart(filter),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                              ),
                            )),
                        child: const Text("Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
