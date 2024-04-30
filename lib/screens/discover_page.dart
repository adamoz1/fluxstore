import 'package:flutter/material.dart';
import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/common/bottom_navigation.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var productController = Get.put(ProductController());
  var themeController = Get.find<ThemeController>();
  TextEditingController searchController = TextEditingController();
  var category1Visiblitiy = false.obs;
  var searchToggle = false.obs;
  @override
  Widget build(BuildContext context) {
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
      body: Obx(() {
        var theme = themeController.isDarkMode.value;
        return ListView(
          shrinkWrap: true,
          children: [
            searchPage(searchController, theme),
            InkWell(
              onTap: () {
                category1Visiblitiy.value = !category1Visiblitiy.value;
              },
              child: searchTile(
                  Constants.searchCloathingBgColor,
                  Constants.searchCloathingCircleColor,
                  "CLOTHING",
                  "assets/search_cloathing.png"),
            ),
            searchListTile("Cloathing", category1Visiblitiy.value),
            searchTile(
                Constants.searchAccessoriesBgColor,
                Constants.searchAccessoriesCircleColor,
                "ACCESSORIES",
                "assets/search_accessories.png"),
            searchTile(
                Constants.searchShoesBgColor,
                Constants.searchShoesCircleColor,
                "SHOES",
                "assets/search_shoes.png"),
            searchTile(
                Constants.searchCollectionBgColor,
                Constants.searchCollectionCircleColor,
                "COLLECTION",
                "assets/search_collection.png"),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavigationPage(),
    );
  }

  searchPage(textController, theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 8,
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 2.0,
                shadowColor: theme ? Colors.transparent : Constants.blackColor,
                child: TextField(
                  controller: textController,
                  readOnly: true,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Get.toNamed(AppRoute.searchProduct);
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          color: theme ? Colors.transparent : Colors.white,
                          width: 0.0),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            width: 0, color: Constants.searchTextfieldBgColor)),
                    filled: true,
                    focusColor: theme
                        ? Constants.searchTextfieldBgColorDM
                        : Constants.searchTextfieldBgColor,
                    fillColor: theme
                        ? Constants.searchTextfieldBgColorDM
                        : Constants.searchTextfieldBgColor,
                    hintText: "Search",
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 20,
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                  width: 51,
                  height: 46,
                  decoration: BoxDecoration(
                      color: theme
                          ? Constants.searchTextfieldBgColorDM
                          : const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            spreadRadius: -12),
                      ]),
                  child: Builder(builder: (context) {
                    return IconButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(15),
                            shadowColor:
                                MaterialStateProperty.all(Colors.black38)),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const ImageIcon(
                            AssetImage("assets/filter_icon.png")));
                  }))),
        ],
      ),
    );
  }

  //This is the tile of the menu bar to open subcategory search
  searchTile(tileColor, circleColor, tileText, imageUrl) {
    var tileHeight = MediaQuery.of(context).size.height / 5;
    return Container(
      height: tileHeight,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: tileColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: tileHeight / 6.5),
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: tileHeight / 2.15,
              backgroundColor: circleColor.withOpacity(0.50),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: tileHeight / 3.85),
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              radius: tileHeight / 2.8,
              backgroundColor: circleColor,
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                height: tileHeight,
                child: Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tileText,
                  style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  searchListTile(category, visibilityState) {
    var object = productController.category
        .firstWhere((element) => element["title"] == category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Visibility(
        visible: visibilityState,
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: categoryTileList(object)),
      ),
    );
  }

  List<Widget> categoryTileList(object) {
    List<Widget> listview = [];
    for (var element in object["subCategory"]) {
      listview.add(categoryContainer(element, 25.00));
      if (element["subCategory"] != null) {
        for (var subElement in element["subCategory"]) {
          listview.add(categoryContainer(subElement, 45.00));
        }
      }
    }
    return listview;
  }

  categoryContainer(category, double paddingSize) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.searchResult, arguments: [category["title"]]);
      },
      child: Row(
        children: [
          SizedBox(
            width: paddingSize,
          ),
          Expanded(
              child: Text(
            category["title"],
            style: const TextStyle(fontWeight: FontWeight.w100),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "${category["items"]} items",
              style: TextStyle(
                  color: Constants.searchLightTextColor,
                  fontWeight: FontWeight.w100),
            ),
          ),
          const Icon(Icons.arrow_right_rounded),
        ],
      ),
    );
  }
}
