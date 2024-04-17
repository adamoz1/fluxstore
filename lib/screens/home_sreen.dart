import 'package:flutter/material.dart';
import 'package:fluxstore/Common/common_drawer.dart';
import 'package:fluxstore/common/bottom_navigation.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: IconButton(
              icon: ImageIcon(AssetImage('assets/drawer_icon.png')),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
        ),
        title: const Text('Gemstore'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/notification');
            },
            icon: Stack(
              children: [
                Icon(Icons.notifications_none_outlined, size: 30),
                Positioned(
                  top: 4,
                  right: 5,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
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
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: BottomNavigationPage(),

    );
  }
}
