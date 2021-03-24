import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:shopping_app_firebase/config.dart';
import 'package:shopping_app_firebase/models/product_model.dart';
import 'package:shopping_app_firebase/user_preferences/preferences.dart';

class ProductProvider {
  final _prefs = UserPreferences();

  Future<bool> makeAProduct(ProductModel product) async {
    final resp = await http.post(
        Uri.parse("$urlApi/products.json?auth=${_prefs.token}"),
        body: productModelToJson(product));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> getProducts() async {
    final resp =
        await http.get(Uri.parse("$urlApi/products.json?auth=${_prefs.token}"));

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    if (decodedData == null) return [];

    final List<ProductModel> products = [];
    print(decodedData);
    decodedData.forEach((id, product) {
      final prodTemp = ProductModel.fromJson(product);
      prodTemp.id = id;

      products.add(prodTemp);
    });

    return products;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse("$cloudService");

    final mimeType = mime(image.path).split("/");
    final imageUploadRequest = http.MultipartRequest("POST", url);

    final file = await http.MultipartFile.fromPath("file", image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final resp =
        await http.Response.fromStream(await imageUploadRequest.send());

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }
    return json.decode(resp.body)["secure_url"];
  }
}
