import 'dart:convert';

List<ClothesShopModelLivingRoom> usersFromJson(String str) =>
    List<ClothesShopModelLivingRoom>.from(
        json.decode(str).map((x) => ClothesShopModelLivingRoom.fromJson(x)));

class ClothesShopModelLivingRoom {
  final int id;
  final String name;
  final String price;
  final String color;
  final String image;
  final String star;
  final String createddate;
  final String userupdated;

  ClothesShopModelLivingRoom(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.image,
      required this.star,
      required this.createddate,
      required this.userupdated});

  factory ClothesShopModelLivingRoom.fromJson(Map<String, dynamic> json) =>
      ClothesShopModelLivingRoom(
          id: json['id'],
          name: json['name'],
          price: json['price'],
          color: json['color'],
          image: json['image'],
          star: json['star'],
          createddate: json['createddate'] ?? "NO DATA",
          userupdated: json['userupdated'] ?? "NO DATA");

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "color": color,
        "image": image,
        "star": star,
        "createddate": createddate,
        "userupdated": userupdated
      };
}
