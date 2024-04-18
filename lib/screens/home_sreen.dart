import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/common/bottom_navigation.dart';
<<<<<<< HEAD
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
import 'package:get/get.dart';

import '../Routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var productController = Get.put(ProductController());
  var themeController = Get.put(ThemeController());
  var categorySelectedName = "Women".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        leading: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: IconButton(
              icon: ImageIcon(AssetImage('assets/drawer_icon.png')),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
        ),
        title: const Text('Gemstore'),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
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
      drawer: CommonDrawer(),
<<<<<<< HEAD
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
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationPage(),
=======
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: BottomNavigationPage(),

>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
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
          const EdgeInsets.only(top: 30.0, bottom: 45, left: 30, right: 30),
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
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
      padding: const EdgeInsets.only(top: 20, left: 30),
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.height / 2.5,
      child: ListView.builder(
        itemCount: productController.productList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 230,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage(
                              productController.productList[index].imagePath ??
                                  ""),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    productController.productList[index].name ?? "Error",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "\$ ${productController.productList[index].price ?? 0}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                )
              ],
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
        padding: const EdgeInsets.only(top: 30, left: 30, bottom: 30),
        height: 150,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: productController.recommendedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 30.0),
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
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: collectionCard("assets/slim_and_beauty.png",
                "|  Sale upto 40%", firstTitle, FontWeight.w100, 180.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
        margin: const EdgeInsets.only(bottom: 40),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme
              ? Constants.topCollectionCardColorDM
              : Constants.topCollectionCardColor,
        ),
        child: Stack(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                        radius: cardHeight / 3,
                        backgroundColor: theme
                            ? Constants.collectionCirleColorDM
                            : Constants.collectionCirleColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: cardHeight,
                      width: 150,
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
}
