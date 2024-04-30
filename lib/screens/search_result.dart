import 'package:flutter/material.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:fluxstore/model/product_model.dart';
import 'package:get/get.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String userSearch = "";
  List<ProductModel> productList = [];
  ProductController productController = Get.put(ProductController());
  ThemeController themeController = Get.find<ThemeController>();
  var theme;
  @override
  void initState() {
    super.initState();
    userSearch = Get.arguments[0];
    getproductList();
    print(productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userSearch,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              }),
        ),
      ),
      body: Obx(() {
        theme = themeController.isDarkMode.value;
        return Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Found\n${productList.length} Results",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.00, horizontal: 15.00),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: theme
                                  ? Constants.searchResultFilterBorderColorDM
                                      .withOpacity(0.15)
                                  : Constants.searchResultFilterBorderColor
                                      .withOpacity(0.15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: theme
                                    ? Constants.searchResultFilterColorDM
                                    : Constants.searchResultFilterColor),
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  getproductList() {
    List<ProductModel> list = productController.productList;
    for (int i = 0; i < list.length; i++) {
      print("List is ${list[i]}");
      String value = list[i].clothType ?? "";
      value = value.toLowerCase();
      print("Value is --$value--");
      if (value.contains(userSearch.toLowerCase())) {
        productList.add(list[i]);
      }
    }
    list = productController.popularThisWeek;
    for (int i = 0; i < list.length; i++) {
      String value = list[i].clothType ?? "";
      if (value.contains(userSearch.toLowerCase())) {
        productList.add(list[i]);
      }
    }
    list = productController.similarProduct;
    for (int i = 0; i < list.length; i++) {
      String value = list[i].clothType ?? "";
      if (value.contains(userSearch.toLowerCase())) {
        productList.add(list[i]);
      }
    }
  }
}
