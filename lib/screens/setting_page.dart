import 'package:flutter/material.dart';
import 'package:fluxstore/common/common_drawer.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
              icon: const ImageIcon(AssetImage('assets/drawer_icon.png')),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              }),
        ),
        title: const Text('Setting'),
        centerTitle: true,
      ),
      drawer: const CommonDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, bottom: 20.0, top: 20.0, right: 12.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, bottom: 20.0, top: 20.0, right: 12.0),
            child: ListTile(
              leading: const Icon(Icons.notifications_none_outlined),
              title: const Text('Notification'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.offAndToNamed('/notificationSetting');
              },
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, bottom: 20.0, top: 20.0, right: 12.0),
            child: ListTile(
              leading: const ImageIcon(AssetImage('assets/medical_chart.png')),
              title: const Text('Terms of Use'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, bottom: 20.0, top: 20.0, right: 12.0),
            child: ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('Pricavy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListTile(
              leading: const ImageIcon(AssetImage('assets/location_arrow.png')),
              title: const Text('Chat Support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 0.6,
          ),
        ],
      ),
    );
  }
}
