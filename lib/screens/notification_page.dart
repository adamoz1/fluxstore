import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.only(left: 5.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Get.offAndToNamed('/homepage');
            }),
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          Card(
            margin: EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 8.0, top: 26.0),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text('Good morning Get 20% Voucher'),
              subtitle: Text(
                  'Summer sale up to 20% off. Limited voucher. Get now!!😜'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0, top: 8.0),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text('Special offer just for you'),
              subtitle: Text('New Autumn Collection 30% off'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0, top: 8.0),
            shadowColor: Colors.black,
            child: ListTile(
              title: Text('Holiday sale 50%'),
              subtitle: Text('Tap here to get 50% voucher.'),
            ),
          ),
        ],
      ),
    );
  }
}
