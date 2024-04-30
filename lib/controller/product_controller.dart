/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Product Controller is used help
with product details.
*/

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
        "dresses",
        false),
    ProductModel(
        "Long Sleeve Dress",
        "Long sleeve dresses effortlessly blend comfort with sophistication, making them a wardrobe staple for any season.",
        45.15,
        "assets/feature_product2.jpg",
        "female",
        "feature",
        "dresses",
        false),
    ProductModel(
        "Sportwear Set",
        "Best for the winter and maintain you look in any location or occasion",
        80.32,
        "assets/feature_product3.jpg",
        "female",
        "feature",
        "dresses",
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

  var category = [
    {
      "title": "Cloathing",
      "subCategory": [
        {"title": "Jacket", "items": 128},
        {"title": "Skirts", "items": 40},
        {
          "title": "Dress",
          "items": 36,
          "subCategory": [
            {"title": "Sweaters", "items": 24},
            {"title": "Jeans", "items": 14}
          ]
        },
      ]
    }
  ].obs;

  var popularThisWeek = [
    ProductModel(
        "Lihuna Tunic White",
        "Its White Beautiful Shirt",
        53.00,
        "assets/popular_this_week1.png",
        "female",
        "popular-this-week",
        "kurti",
        false),
    ProductModel(
        "Skirt Dress",
        "Comfortable Summer Floral Long Skirt",
        34.00,
        "assets/popular_this_week2.png",
        "female",
        "popular-this-week",
        "dresses",
        false),
    ProductModel(
        "Kimi Green Dress",
        "Top Summer Trend Dress",
        47.99,
        "assets/popular_this_week3.png",
        "female",
        "popular-this-week",
        "dresses",
        false),
  ].obs;

  var similarProduct = [
    ProductModel(
        "Rise Crop Hoodie",
        "Hoodie comes with varity of feel and comfort with fashion to the user.",
        43.15,
        "assets/dress2.png",
        "female",
        "similar-product",
        "hoddie",
        false),
    ProductModel(
        "Gym Crop Top",
        "Flexibility and elasticity comes on the top for this brand and product to treat the user.",
        39.99,
        "assets/similar2.png",
        "female",
        "popular-this-week",
        "gym top",
        false),
    ProductModel(
        "Sport Sweatshirt",
        "Better with the sports, better with the sweat. Helps to handle anything.",
        47.99,
        "assets/similar3.png",
        "female",
        "popular-this-week",
        "gym top",
        false),
    ProductModel(
        "Gym Crop Top",
        "Flexibility and elasticity comes on the top for this brand and product to treat the user.",
        12.99,
        "assets/similar2.png",
        "female",
        "popular-this-week",
        "gym top",
        false),
  ];
}
