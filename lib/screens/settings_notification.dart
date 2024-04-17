import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Container(
              padding: EdgeInsets.only(left: 5.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                // color: Color(0xFFF6F1F5),
                borderRadius: BorderRadius.circular(50),

              ),
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Get.offAndToNamed('/homepage');
            }),
        title: const Text('Notification'),
        centerTitle: true,
      ),
    );
  }
}
