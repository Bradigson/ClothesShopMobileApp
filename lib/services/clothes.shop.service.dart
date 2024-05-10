import 'package:clothes_shop/models/clothes.shop.model.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<ClothesShopModelLivingRoom>?> fetchLivinRoom() async {
  //final  url = dotenv.env['BASE_URL_LIVINGROOM'].toString();
  String url = "http://3.144.180.4:2000/api/v1/livingRoom";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // Procesar la respuesta exitosa
    var json = response.body;
    //print(json);
    return usersFromJson(json);
  } else {
    // Manejar el error
    print('Error: ${response.statusCode}');
    return null;
  }
}







