import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
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
                // color: Color(0xFFF6F1F5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Get.offAndToNamed('/profile');
            }),
        title: const Text('Voucher'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 40.0),
        children: [
          Card(
            margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 15.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 17.0,top: 8.0,bottom: 8.0),
              child:  Row(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                      height: 90, // Set a fixed height
                      width: 90,
                      child: const Center(
                        child: Text(
                          '50%',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Black Friday",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Sales off 50%"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Code: fridaysale",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                  const SizedBox(width: 30), // Adjust the width as needed
                  const VerticalDivider(color: Colors.black), // Add a vertical divider
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Exp."),
                      SizedBox(
                        height: 15,
                      ),
                      Text("20",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Dec",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                ],
              ),
            ),
          ),



          Card(
            margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 15.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 17.0,top: 8.0,bottom: 8.0),
              child:  Row(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: 90, // Set a fixed height
                    width: 90,
                    child: const Center(
                      child: Text(
                        '30%',
                        style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Holiday Sale",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Sales off 30%"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Code: holiday30",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                  const SizedBox(width: 30), // Adjust the width as needed
                  const VerticalDivider(color: Colors.black), // Add a vertical divider
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Exp."),
                      SizedBox(
                        height: 15,
                      ),
                      Text("22",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Dec",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                ],
              ),
            ),
          ),





          Card(
            margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 15.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 17.0,top: 8.0,bottom: 8.0),
              child:  Row(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF737373),
                    ),
                    height: 90, // Set a fixed height
                    width: 90,
                    child: const Center(
                      child: Text(
                        '20%',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Black Friday",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("20% off your first order"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Code: welcome",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                  const SizedBox(width: 10), // Adjust the width as needed
                  const VerticalDivider(color: Colors.black), // Add a vertical divider
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Exp."),
                      SizedBox(
                        height: 15,
                      ),
                      Text("20",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Dec",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}


