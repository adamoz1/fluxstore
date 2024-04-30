import 'package:flutter/material.dart';
import 'package:fluxstore/Routes/app_routes.dart';
import 'package:fluxstore/constants.dart';
import 'package:fluxstore/controller/product_controller.dart';
import 'package:fluxstore/controller/theme_controller.dart';
import 'package:get/get.dart';

class DiscoverSearchPage extends StatefulWidget {
  const DiscoverSearchPage({super.key});

  @override
  State<DiscoverSearchPage> createState() => _DiscoverSearchPageState();
}

class _DiscoverSearchPageState extends State<DiscoverSearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var productController = Get.put(ProductController());
  var themeController = Get.find<ThemeController>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Obx(() {
        var theme = themeController.isDarkMode.value;
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    searchPage(searchController, theme),
                    recentSearchTitle(theme),
                    recentSearch(theme),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    categoryTitle("Popular this week"),
                    featureProduct(),
                  ],
                ),
              ),
            );
          },
        );
      }),
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
                  onSubmitted: (userSearch) {
                    Get.toNamed(AppRoute.searchResult, arguments: [userSearch]);
                  },
                  controller: textController,
                  textInputAction: TextInputAction.search,
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

  recentSearchTitle(theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(children: [
        Text(
          "Recent Searches",
          style: TextStyle(
              color: theme
                  ? Constants.searchTitleColorDM
                  : Constants.searchTitleColor),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: ImageIcon(
              const AssetImage("assets/trash_icon.png"),
              color: theme
                  ? Constants.searchTitleColorDM
                  : Constants.searchTitleColor,
            )),
      ]),
    );
  }

  recentSearch(theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            searchTile("Sunglasses", theme),
            searchTile("Sweater", theme),
            searchTile("Hoodie", theme),
          ],
        ),
      ),
    );
  }

  searchTile(title, theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: theme ? Constants.searchTileColorDM : Constants.searchTileColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: theme
                    ? Constants.searchTitleColorDM
                    : Constants.searchTitleColor),
          ),
          const SizedBox(
            width: 30,
          ),
          Icon(
            Icons.close_rounded,
            color: theme
                ? Constants.searchTileCloseButtonDM
                : Constants.searchTileCloseButton,
          )
        ],
      ),
    );
  }

  categoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              "Show all",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Constants.subHeadingColor),
            ),
          )
        ],
      ),
    );
  }

  featureProduct() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      child: ListView.builder(
        itemCount: productController.popularThisWeek.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoute.productDetail, arguments: [
                  productController.popularThisWeek[index],
                  index,
                  "popularThisWeek"
                ]);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage(productController
                                    .popularThisWeek[index].imagePath ??
                                ""),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      productController.productList[index].name ?? "Error",
                      style: const TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
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
}
