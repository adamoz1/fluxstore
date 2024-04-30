import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/common/bottom_navigation.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var productController = Get.put(ProductController());
  var themeController = Get.find<ThemeController>();
  var categorySelectedName = "Women".obs;
  @override
  Widget build(BuildContext context) {
    print(themeController.isDarkMode.value);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: IconButton(
            icon: const ImageIcon(
              AssetImage('assets/drawer_icon.png'),
              size: 16,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            }),
        title: const Text(
          'Gemstore',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.notificationPage);
            },
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none_outlined, size: 26),
                Positioned(
                  top: 4,
                  right: 5,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            category(),
            autumnCollection(),
            categoryTitle("Feature Products"),
            featureProduct(),
            newCollectionPoster(),
            categoryTitle("Recommanded"),
            recommandedListTile(),
            categoryTitle("Top Collection"),
            topCollectionList(),
            verticalCollectionCards()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationPage(),
    );
  }

  category() {
    return Obx(() {
      print(categorySelectedName);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            categoryIcon("assets/Women.png", "Women"),
            categoryIcon("assets/men.png", "Men"),
            categoryIcon("assets/accessories.png", "Accessories"),
            categoryIcon("assets/beauty.png", "Beauty"),
          ],
        ),
      );
    });
  }

  categoryIcon(imagePath, String categoryName) {
    return Obx(() {
      var theme = themeController.isDarkMode.value;
      var isSelected = false.obs;
      print("CategoryIcon is $categoryName");
      if (categoryName == categorySelectedName.value) {
        print("Category is $categoryName");
        isSelected.value = true;
      }
      return Column(
        children: [
          InkWell(
            onTap: () => categorySelectedName.value = categoryName,
            child: Stack(children: [
              isSelected.value
                  ? CircleAvatar(
                      radius: 31,
                      backgroundColor: theme
                          ? Constants.categoryBackground1DM
                          : Constants.categoryBackground1,
                    )
                  : Container(),
              isSelected.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 1.5, left: 1.5),
                      child: CircleAvatar(
                        radius: 29.5,
                        backgroundColor:
                            theme ? Constants.blackColor : Constants.whiteColor,
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(
                    top: isSelected.value ? 4.0 : 0.0,
                    left: isSelected.value ? 4.0 : 0.0),
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                      _getIconBackgroundColor(isSelected.value, theme),
                  child: Image(
                    image: AssetImage(imagePath),
                    color: _getIconColor(isSelected.value, theme),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                  color: isSelected.value
                      ? (theme
                          ? Constants.categorySelectedIconTextColorDM
                          : Constants.categorySelectedIconTextColor)
                      : (theme
                          ? Constants.categoryNotSelectedIconTextColorDM
                          : Constants.categoryNotSelectedIconTextColor)),
            ),
          )
        ],
      );
    });
  }

  Color _getIconBackgroundColor(bool isSelected, theme) {
    return isSelected
        ? (theme
            ? Constants.categoryBackground1DM
            : Constants.categoryBackground1)
        : (theme
            ? Constants.categoryBackground2DM
            : Constants.categoryBackground2);
  }

  Color _getIconColor(bool isSelected, theme) {
    return isSelected
        ? (theme
            ? Constants.categoryIconColorSelectedDM
            : Constants.categoryIconColorSelected)
        : (theme
            ? Constants.categoryIconColorNotSelectedDM
            : Constants.categoryIconColorNotSelected);
  }

  autumnCollection() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, bottom: 30, left: 30, right: 30),
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          Container(
              height: 215,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage('assets/autumn_collection.jpg'),
                      fit: BoxFit.fitWidth))),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 23),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                '''
                      Autumn
                      Collection
                      2022
                      ''',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Constants.whiteColor),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  categoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Text(
            "Show all",
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Constants.subHeadingColor),
          )
        ],
      ),
    );
  }

  featureProduct() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 100,
      height: 330,
      child: ListView.builder(
        itemCount: productController.productList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoute.productDetail, arguments: [
                  productController.productList[index],
                  index,
                  "productController"
                ]);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 165,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(productController
                                    .productList[index].imagePath ??
                                ""),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      productController.productList[index].name ?? "Error",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      "\$ ${productController.productList[index].price ?? 0}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  newCollectionPoster() {
    return Obx(() {
      var theme = themeController.isDarkMode.value;
      return Container(
        margin: const EdgeInsets.only(bottom: 40),
        width: double.infinity,
        color: theme
            ? Constants.collectionContainerColorDM
            : Constants.collectionContainerColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "|  New Collection",
                  style: TextStyle(
                      fontSize: 18,
                      color: theme
                          ? Constants.collectionLightTextColorDM
                          : Constants.collectionLightTextColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Hang Out",
                  style: TextStyle(
                      color: theme
                          ? Constants.collectionDarkTextColorDM
                          : Constants.collectionDarkTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                Text(
                  "& Party",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: theme
                          ? Constants.collectionDarkTextColorDM
                          : Constants.collectionDarkTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: theme
                        ? Constants.collectionCirleColorDM.withOpacity(0.50)
                        : Constants.collectionCirleColor.withOpacity(0.50),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: theme
                          ? Constants.collectionCirleColorDM
                          : Constants.collectionCirleColor,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/hang_out_party_image.png"))),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  recommandedListTile() {
    return Obx(() {
      var theme = themeController.isDarkMode.value;
      return Container(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        height: 150,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: productController.recommendedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme
                            ? Constants.recommandedListTileColorDM
                            : Constants.recommandedListTileBgColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: theme
                              ? Constants.recommandedListTileBorderColorDM
                              : Constants.recommandedListTileBorderColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${productController.recommendedList[index]["title"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              "\$ ${productController.recommendedList[index]["price"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(
                                  "${productController.recommendedList[index]["imageUrl"]}"),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              );
            }),
      );
    });
  }

  topCollectionList() {
    var firstTitle = "FOR SLIM\n& BEAUTY";
    var secondTitle = "Most sexy\n& fabulous\ndesign";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: collectionCard("assets/slim_and_beauty.png",
                "|  Sale upto 40%", firstTitle, FontWeight.w100, 180.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: collectionCard(
                "assets/fabulous_design.png",
                "|  Summer Collection 2021",
                secondTitle,
                FontWeight.w500,
                250.0),
          )
        ],
      ),
    );
  }

  collectionCard(
      imagePath, topTitle, mainTitle, mainTitleFontWidth, cardHeight) {
    return Obx(() {
      var theme = themeController.isDarkMode.value;
      return Container(
        height: cardHeight,
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme
              ? Constants.topCollectionCardColorDM
              : Constants.topCollectionCardColor,
        ),
        child: Stack(
          children: [
            // Expanded(
            //   child: Container(),
            // ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 2),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: CircleAvatar(
                        radius: cardHeight / 3.1,
                        backgroundColor: theme
                            ? Constants.collectionCirleColorDM
                            : Constants.collectionCirleColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: cardHeight,
                      width: 130,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage("$imagePath"))),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "$topTitle",
                    style: TextStyle(
                        fontSize: 15,
                        color: theme
                            ? Constants.collectionLightTextColorDM
                            : Constants.collectionLightTextColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "$mainTitle",
                    style: TextStyle(
                        color: theme
                            ? Constants.collectionDarkTextColorDM
                            : Constants.collectionDarkTextColor,
                        fontWeight: mainTitleFontWidth,
                        fontSize: 19),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  verticalCollectionCards() {
    return Obx(() {
      var theme = themeController.isDarkMode.value;
      return Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: theme
                    ? Constants.topCollectionCardColorDM
                    : Constants.topCollectionCardColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 250,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/tshirt_office_light.png"),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, left: 16),
                              child: Text(
                                "T-Shirts",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: theme
                                        ? Constants
                                            .topCollectionMainTextColor1DM
                                        : Constants
                                            .topCollectionMainTextColor1),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, left: 16),
                              child: Text(
                                "The\nOffice\nLife",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: theme
                                        ? Constants
                                            .topCollectionMainTextColor2DM
                                        : Constants
                                            .topCollectionMainTextColor2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme
                    ? Constants.topCollectionCardColorDM
                    : Constants.topCollectionCardColor,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/dress_eligant_design.png"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 16),
                        child: Text(
                          "Dresses",
                          style: TextStyle(
                              fontSize: 16,
                              color: theme
                                  ? Constants.topCollectionMainTextColor1DM
                                  : Constants.topCollectionMainTextColor1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 16),
                        child: Text(
                          "Elegant\nDesign",
                          style: TextStyle(
                              fontSize: 19,
                              color: theme
                                  ? Constants.topCollectionMainTextColor2DM
                                  : Constants.topCollectionMainTextColor2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      );
    });
  }
}
