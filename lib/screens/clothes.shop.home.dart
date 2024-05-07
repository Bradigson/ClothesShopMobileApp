import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:clothes_shop/services/clothes.shop.service.dart';
import 'package:clothes_shop/services/home.icons.dart';
import 'package:flutter/material.dart';

class ClothesShopHome extends StatefulWidget {
  const ClothesShopHome({super.key});

  @override
  State<ClothesShopHome> createState() => _ClothesShopHome();
}

class _ClothesShopHome extends State<ClothesShopHome> {
  List<ClothesShopModelLivingRoom>? livingRoom;
  var isLoading = false;
  List<bool> isClickedList = List.generate(10, (index) => false);
  List<ClothesShopLivingRoomProducts> displayIconsTabBarHome = [];

  //para mostrar los filtros
  List<ClothesShopModelLivingRoom>? displayedAllLivingRoomProducts = [];

  @override
  void initState() {
    displayIconsTabBarHome = iconsTabBarHome;
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

  //filter for livingRoom
  void filterLivingRoom(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedAllLivingRoomProducts = livingRoom;
      });
    } else {
      setState(() {
        displayedAllLivingRoomProducts = livingRoom
            ?.where((lrp) =>
                lrp.name.toLowerCase().contains(query.toLowerCase()) ||
                lrp.price.toLowerCase().contains(query.toLowerCase()) ||
                lrp.createddate.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _handleTap(int index) {
    setState(() {
      // Recorre toda la lista y reinicia todos los valores a false
      for (int i = 0; i < isClickedList.length; i++) {
        isClickedList[i] = false;
      }
      // Establece el elemento clicado como true
      isClickedList[index] = true;
    });
  }

  void handleNavigate(int id) {
    Navigator.pushNamed(context, '/view', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const ClothesShopAppBar(),
      // endDrawer: const ClothesShopMenus(),
      body: Column(
        children: [
          //input to search
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 241, 241, 241)),
            child: TextField(
              onChanged:
                  filterLivingRoom, //llamamos la function que realiza el filtro
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),

          //slide of the header
          SizedBox(
            height: 68,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: iconsTabBarHome.length,
              itemBuilder: (context, index) {
                String img = displayIconsTabBarHome[index].url;
                print(img);
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isClickedList[index] ? Colors.amber : Colors.white,
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    width: 68,
                    height: 68,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset("assets/images/${img}", scale: 2),
                        ),
                        SizedBox(
                          child: Text(
                            displayIconsTabBarHome[index].name,
                            style: TextStyle(
                                fontSize: 13,
                                color: isClickedList[index]
                                    ? Colors.black
                                    : Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          //all living room products
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                setState(() {
                  getData();
                });
              },
              //color: const Color.fromARGB(255, 66, 160, 237),
              //backgroundColor: const Color.fromARGB(255, 238, 192, 55),
              child: Visibility(
                visible: isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 229, 147, 24)),
                  ),
                ),
                child: GridView.builder(
                  itemCount: displayedAllLivingRoomProducts?.length,
                  shrinkWrap:
                      false, //esto hace que al hacer scroll el contenedor de los items en cierto punto se achique y se vea mal
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 350),
                  itemBuilder: (context, index) {
                    String img = displayedAllLivingRoomProducts![index].image;
                    String price = displayedAllLivingRoomProducts![index].price;
                    if (displayedAllLivingRoomProducts != null) {
                      return GestureDetector(
                        onTap: () => handleNavigate(index),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          //color: Colors.red,
                          height: 200,
                          //margin: EdgeInsets.fromLTRB(0, , right, bottom),
                          child: Container(
                            //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Colors.blue,
                            ),

                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4, // Ocupa 2 partes de 3
                                  child: Container(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          img,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                    flex: 0, // Ocupa 2 partes de 3
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            displayedAllLivingRoomProducts![
                                                    index]
                                                .name,
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 19,
                                                fontFamily: 'VarelaRound'),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\$ $price",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                fontFamily: 'VarelaRound'),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, '/');
                      return const SizedBox(
                        child: Text("No Data Found"),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: const ClothesShopFooter(),
    );
  }
}
