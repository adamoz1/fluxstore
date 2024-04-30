import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/common/app_text.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/model/product_model.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late bool theme;
  late ProductModel model;
  var productIndex, productCategory;
  var productController = Get.put(ProductController());
  var themeController = Get.find<ThemeController>();
  var isFavorite = false.obs;

  @override
  void initState() {
    super.initState();
    model = Get.arguments[0];
    productIndex = Get.arguments[1];
    productCategory = Get.arguments[2];
    model.favoriate == true
        ? isFavorite.value = true
        : isFavorite.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      theme = themeController.isDarkMode.value;
      return Scaffold(
        backgroundColor: theme ? Constants.blackColor : Constants.whiteColor,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image(
                            height: 400,
                            width: double.infinity,
                            image: AssetImage(model.imagePath ??
                                "assets/popular_this_week1.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                            top: 40,
                            left: 20,
                            right: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  iconSize: 23,
                                  constraints:
                                      const BoxConstraints(maxWidth: 150),
                                  padding: const EdgeInsets.all(7),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => theme
                                                  ? Constants.blackColor
                                                  : Colors.white),
                                      elevation: MaterialStateProperty.all(15),
                                      shadowColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => theme
                                                  ? Constants.blackColor
                                                  : Colors.black)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                      Icons.keyboard_arrow_left_rounded),
                                ),
                                IconButton(
                                  iconSize: 26,
                                  constraints:
                                      const BoxConstraints(maxWidth: 150),
                                  padding: const EdgeInsets.all(4),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => theme
                                                  ? Constants.blackColor
                                                  : Colors.white),
                                      elevation: MaterialStateProperty.all(15),
                                      shadowColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => theme
                                                  ? Constants.blackColor
                                                  : Constants.whiteColor)),
                                  onPressed: () {
                                    bool value = model.favoriate ?? false;
                                    model.favoriate = !value;
                                    changeFavoriteStatus(
                                        !value, productCategory, productIndex);
                                    isFavorite.value = !value;
                                  },
                                  icon: Icon(
                                    model.favoriate ?? true
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: isFavorite.value
                                        ? Colors.red
                                        : theme
                                            ? Constants.whiteColor
                                            : Constants.blackColor,
                                  ),
                                ),
                              ],
                            )),
                        mainProductDetailCard(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            addToCartButton()
          ],
        ),
      );
    });
  }

  mainProductDetailCard(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 300,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: theme
                      ? Colors.transparent
                      : Colors.black.withOpacity(0.25),
                  spreadRadius: .03,
                )
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: theme ? Constants.blackColor : Colors.white),
          child: Column(children: [
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "${model.name}",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                                color: Colors.teal,
                                size: 24,
                                Icons.star_outlined),
                            Icon(
                                color: Colors.teal,
                                size: 24,
                                Icons.star_outlined),
                            Icon(
                                color: Colors.teal,
                                size: 24,
                                Icons.star_outlined),
                            Icon(
                                color: Colors.teal,
                                size: 24,
                                Icons.star_outlined),
                            Icon(
                                color: Colors.teal,
                                size: 24,
                                Icons.star_outlined),
                            AppText(
                              "(83)",
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    "\$ ${model.price}",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color:
                    theme ? Constants.dividerColorDM : Constants.dividerColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: purchasePreference(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color:
                    theme ? Constants.dividerColorDM : Constants.dividerColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor:
                      theme ? Constants.whiteColor : Constants.blackColor,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                  initiallyExpanded: true,
                  title:
                      const AppText("Description", fontWeight: FontWeight.w500),
                  children: [AppText("${model.description}")],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color:
                    theme ? Constants.dividerColorDM : Constants.dividerColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  iconColor:
                      theme ? Constants.whiteColor : Constants.blackColor,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: const AppText(
                    "Reviews",
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    reviews(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color:
                    theme ? Constants.dividerColorDM : Constants.dividerColor,
              ),
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                dense: true,
                initiallyExpanded: true,
                iconColor: theme ? Constants.whiteColor : Constants.blackColor,
                tilePadding: const EdgeInsets.symmetric(horizontal: 25),
                title: AppText(
                  "Similar Product",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                children: [similarProducts()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color:
                    theme ? Constants.dividerColorDM : Constants.dividerColor,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  addToCartButton() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: theme ? Constants.addToCardColorDM : Constants.addToCardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            color: theme
                ? Constants.addToCardTextColorDM
                : Constants.addToCardTextColor,
            size: 30,
          ),
          const SizedBox(
            width: 18,
          ),
          AppText(
            "Add To Cart",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: theme
                ? Constants.addToCardTextColorDM
                : Constants.addToCardTextColor,
          ),
        ],
      ),
    );
  }

  purchasePreference() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customSizedBox(0.00, 10.00),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                "Color",
                fontSize: 13,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: .01,
                              color: Color.fromARGB(169, 158, 158, 158),
                              offset: Offset(.5, .5))
                        ],
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.orange,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.black,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                "Size",
                fontSize: 14,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(31, 158, 158, 158),
                        shape: BoxShape.circle),
                    child: const AppText(
                      "S",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(31, 158, 158, 158),
                        shape: BoxShape.circle),
                    child: const AppText(
                      "M",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 96, 96, 96),
                        shape: BoxShape.circle),
                    child: const AppText(
                      "L",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  reviews() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppText(
                  "4.9",
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  "     OUT OF 5",
                  fontSize: 9,
                  color: Colors.grey,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(color: Colors.teal, size: 18, Icons.star_rounded),
                    Icon(color: Colors.teal, size: 18, Icons.star_rounded),
                    Icon(color: Colors.teal, size: 18, Icons.star_rounded),
                    Icon(color: Colors.teal, size: 18, Icons.star_rounded),
                    Icon(color: Colors.teal, size: 18, Icons.star_rounded)
                  ],
                ),
                AppText(
                  "83 ratings",
                  color: Colors.grey,
                  fontSize: 10,
                )
              ],
            )
          ],
        ),
        reviewSlider(5, 0.8, 80),
        reviewSlider(4, 0.12, 12),
        reviewSlider(3, 0.05, 5),
        reviewSlider(2, 0.03, 3),
        reviewSlider(1, 0, 0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "47 Reviews",
              fontSize: 12,
              color: Colors.grey,
            ),
            Row(
              children: [
                AppText(
                  "WRITE A REVIEW ",
                  fontSize: 12,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 18,
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        commentCard("assets/dress1.png", "Jennifer Rose",
            "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!"),
        const SizedBox(
          height: 30,
        ),
        commentCard("assets/review2.png", "Kelly Rihana",
            "I'm very happy with order, It was delivered on and good quality. Recommended!"),
      ],
    );
  }

  reviewSlider(starRate, double starValue, starPercentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AppText(
            "$starRate",
            fontSize: 12,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 4,
          ),
          const Icon(
            size: 17,
            Icons.star_rounded,
            color: Colors.teal,
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: SizedBox(
              height: 5,
              width: 100,
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromARGB(60, 158, 158, 158),
                value: starValue,
                color: Colors.teal,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            "$starPercentage%",
            fontSize: 12,
          )
        ],
      ),
    );
  }

  commentCard(imageUrl, name, comment) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("$imageUrl"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "$name",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(color: Colors.teal, size: 16, Icons.star_rounded),
                      Icon(color: Colors.teal, size: 16, Icons.star_rounded),
                      Icon(color: Colors.teal, size: 16, Icons.star_rounded),
                      Icon(color: Colors.teal, size: 16, Icons.star_rounded),
                      Icon(color: Colors.teal, size: 16, Icons.star_rounded)
                    ],
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const AppText(
                "5m ago",
                fontSize: 12,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AppText("$comment")
        ],
      ),
    );
  }

  List<Widget> getSimilarProductsList() {
    List<Widget> similarProductList = [];
    var productList = productController.similarProduct;
    for (int i = 0; i < productList.length; i++) {
      similarProductList.add(customSizedBox(20.00, 0.00));
      similarProductList.add(productCard(productList[i].imagePath,
          productList[i].name, productList[i].price, productList[i], i));
    }
    return similarProductList;
  }

  similarProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: getSimilarProductsList()),
    );
  }

  productCard(
    imagePath,
    title,
    price,
    object,
    index,
  ) {
    return InkWell(
      onTap: () {
        print("Page Change function is been called");
        Get.toNamed(AppRoute.productDetail,
            arguments: [object, index, "similarProduct"],
            preventDuplicates: false);
        print("Page Change function is been ended");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("$imagePath"))),
          ),
          customSizedBox(0.00, 12.00),
          AppText(
            "$title",
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          customSizedBox(0.00, 8.00),
          AppText(
            "\$ $price",
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  customSizedBox(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  changeFavoriteStatus(value, category, index) {
    if (category == "productList") {
      productController.productList[index].favoriate = value;
    } else if (category == "similarProduct") {
      productController.similarProduct[index].favoriate = value;
    } else if (category == "popularThisWeek") {
      productController.popularThisWeek[index].favoriate = value;
    }
  }
}
