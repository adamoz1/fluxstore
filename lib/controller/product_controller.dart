import 'package:fluxstore/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = [
    ProductModel(
        "Turtleneck Sweater",
        "Best for the winter and maintain you look in any location or occasion",
        39.99,
        "assets/feature_product1.jpg",
        "female",
        "feature",
        false),
    ProductModel(
        "Long Sleeve Dress",
        "Long sleeve dresses effortlessly blend comfort with sophistication, making them a wardrobe staple for any season.",
        45.00,
        "assets/feature_product2.jpg",
        "female",
        "feature",
        false),
    ProductModel(
        "Sportwear Set",
        "Best for the winter and maintain you look in any location or occasion",
        80.00,
        "assets/feature_product3.jpg",
        "female",
        "feature",
        false),
  ].obs;

  var recommendedList = [
    {
      "title": "White fashion hoddie",
      "price": 29.00,
      "imageUrl": "assets/recommended_image1.png"
    },
    {
      "title": "Cotton T-shirt",
      "price": 30.00,
      "imageUrl": "assets/recommended_image2.png"
    }
  ].obs;
}
