import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fluxstore/Routes/app_routes.dart';
=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
import 'package:fluxstore/common/bottom_navigation.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 130,
            ),
=======
      body:
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 130,),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: const CircleAvatar(
<<<<<<< HEAD
                    foregroundImage: AssetImage('assets/profile.png')),
                title: const Text('Sunie Pham'),
                subtitle: const Text('sunieux@gmail.com'),
                trailing: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.profileSetting);
                  },
                  icon: const Icon(Icons.settings),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
=======
                    foregroundImage: AssetImage('assets/profile.png')
                ),
                title: const Text('Sunie Pham'),
                subtitle: const Text('sunieux@gmail.com'),
                trailing: IconButton(onPressed: (){
                  Get.offAndToNamed('/setting');
                },icon: const Icon(Icons.settings),),
              ),
            ),
            const SizedBox(height: 30,),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
            Card(
              margin: const EdgeInsets.all(20.0),
              // color: Colors.white,
              child: ListView(
<<<<<<< HEAD
                shrinkWrap:
                    true, // Ensure that the ListView takes only the space it needs
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 8.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.location_on_rounded,
                          color:
                              Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Address'),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.wallet_outlined,
                          color:
                              Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Payment Method'),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ImageIcon(
                        AssetImage('assets/voucher.png'),
                        color: Get.isDarkMode ? Colors.white60 : Colors.black26,
                      ),
                      title: const Text('Voucher'),
                      onTap: () {
                        Get.toNamed('/voucher');
=======

                shrinkWrap: true, // Ensure that the ListView takes only the space it needs
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 8.0),
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.location_on_rounded,color: Get.isDarkMode ? Colors.white60 : Colors.black26),
                        title: const Text('Address'),
                        onTap: (){

                        },
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.wallet_outlined,color: Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Payment Method'),
                      onTap: (){

                      },
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ImageIcon(AssetImage('assets/voucher.png'),color: Get.isDarkMode ? Colors.white60 : Colors.black26,),
                      title: const Text('Voucher'),
                      onTap: (){
                          Get.offAndToNamed('/voucher');
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
                      },
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
<<<<<<< HEAD
                      leading: Icon(Icons.favorite,
                          color:
                              Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Wishlist'),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.star_rounded,
                          color:
                              Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Rate this app'),
                      onTap: () {
                        Get.toNamed('/rateApp');
=======
                      leading: Icon(Icons.favorite,color: Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Wishlist'),
                      onTap: (){

>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
                      },
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
<<<<<<< HEAD
                      leading: Icon(Icons.logout,
                          color:
                              Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Log Out'),
                      onTap: () {},
                    ),
                  ),
=======
                      leading: Icon(Icons.star_rounded,color: Get.isDarkMode ? Colors.white60 : Colors.black26 ),
                      title: const Text('Rate this app'),
                      onTap: (){
                          Get.offAndToNamed('/rateApp');
                      },
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.logout,color: Get.isDarkMode ? Colors.white60 : Colors.black26),
                      title: const Text('Log Out'),
                      onTap: (){

                      },
                    ),
                  ),

>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
                ],
              ),
            )
          ],
        ),
<<<<<<< HEAD
      ),
=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
      bottomNavigationBar: BottomNavigationPage(),
    );
  }
}
