import 'package:flutter/material.dart';
import 'package:fluxstore/common/bottom_navigation.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Discover Page"),
      ),
      bottomNavigationBar: BottomNavigationPage(),
    );
  }
}
