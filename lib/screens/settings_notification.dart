import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  bool switchValue = false;
  bool switchValue1 = false;
  bool switchValue2 = false;

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
              Get.offAndToNamed('/setting');
            }),
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: Text('Show notification',style: TextStyle(fontSize: 20),),
            subtitle: Text('Receive push notification for new messages',style: TextStyle(fontSize: 13),),
            trailing: Switch(
              value: switchValue, // Pass the initialized switch value
              onChanged: (bool newValue) { // Update the switch value when it changes
                setState(() {
                  switchValue = newValue; // Update the switch value
                });
              },
              activeColor: switchValue ? Colors.green : Colors.white60, // Set active color based on switch value
              inactiveTrackColor: switchValue ? Colors.white : Colors.white60,
            )
          ),
          ListTile(
              title: Text('Notification Sound',style: TextStyle(fontSize: 20),),
              subtitle: Text('Play sound for new',style: TextStyle(fontSize: 13),),
              trailing: Switch(
                value: switchValue1, // Pass the initialized switch value
                onChanged: (bool newValue) { // Update the switch value when it changes
                  setState(() {
                    switchValue1 = newValue; // Update the switch value
                  });
                },
                activeColor: switchValue1 ? Colors.green : Colors.white60, // Set active color based on switch value
                inactiveTrackColor: switchValue1 ? Colors.green : Colors.white60,
              )
          ),

          ListTile(
              title: Text('Look screen notifications',style: TextStyle(fontSize: 20),),
              subtitle: Text('Allow notification on the lock screen',style: TextStyle(fontSize: 13),),
              trailing: Switch(
                value: switchValue2, // Pass the initialized switch value
                onChanged: (bool newValue) { // Update the switch value when it changes
                  setState(() {
                    switchValue2 = newValue; // Update the switch value
                  });
                },
                activeColor: switchValue2 ? Colors.green : Colors.white60, // Set active color based on switch value
                inactiveTrackColor: switchValue2 ? Colors.green : Colors.white60,
              )
          ),
        ],
      ),
    );
  }
}
