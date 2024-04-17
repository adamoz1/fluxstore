import 'package:flutter/material.dart';
import 'package:fluxstore/common/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 130,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: const CircleAvatar(
                    foregroundImage: AssetImage('assets/profile.png')
                ),
                title: const Text('Sunie Pham'),
                subtitle: const Text('sunieux@gmail.com'),
                trailing: IconButton(onPressed: (){},icon: const Icon(Icons.settings),),
              ),
            ),
            const SizedBox(height: 30,),
            Card(
              margin: const EdgeInsets.all(20.0),
              color: Colors.white,
              child: ListView(
                shrinkWrap: true, // Ensure that the ListView takes only the space it needs
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 8.0),
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.location_on_rounded),
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
                      leading: const Icon(Icons.wallet_outlined),
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
                      leading: const ImageIcon(AssetImage('assets/voucher.png')),
                      title: const Text('Voucher'),
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
                      leading: const Icon(Icons.favorite),
                      title: const Text('Wishlist'),
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
                      leading: const Icon(Icons.star_rounded),
                      title: const Text('Rate this app'),
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
                      leading: const Icon(Icons.logout),
                      title: const Text('Log Out'),
                      onTap: (){

                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 0.8,
                  ),
                ],
              ),
            )
          ],
        ),
      bottomNavigationBar: BottomNavigationPage(),
    );
  }
}
