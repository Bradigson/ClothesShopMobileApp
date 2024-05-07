import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:clothes_shop/services/clothes.shop.service.dart';
import 'package:flutter/material.dart';

class ClothesShoppViewProdusct extends StatefulWidget {
  const ClothesShoppViewProdusct({super.key});

  @override
  State<ClothesShoppViewProdusct> createState() => _ClothesShoppViewProdusct();
}

class _ClothesShoppViewProdusct extends State<ClothesShoppViewProdusct> {
  List<ClothesShopModelLivingRoom>? livingRoom;
  List<ClothesShopModelLivingRoom>? displayedAllLivingRoomProducts = [];
  var isLoading = false;

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

  @override
  Widget build(BuildContext context) {


    final parametro = ModalRoute.of(context)?.settings.arguments as int;



     if (parametro == null || 
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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(filter.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'VarelaRound'
                  )),
                ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Text("\$ ${filter.price}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'VarelaRound'
                      )
                    ),
                    const Row( 
                      children: [ 
                        Icon(Icons.plus_one_outlined)
                      ],
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
