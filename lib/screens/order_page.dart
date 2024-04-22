import 'package:flutter/material.dart';
import 'package:fluxstore/common/bottom_navigation.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Order Page"),
      ),
      bottomNavigationBar: BottomNavigationPage(),
    );
  }
}
