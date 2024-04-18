import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
