import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxstore/controller/rateapp_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RateAppPage extends StatefulWidget {
  const RateAppPage({Key? key}) : super(key: key);

  @override
  State<RateAppPage> createState() => _RateAppPageState();
}

class _RateAppPageState extends State<RateAppPage> {
  @override
  Widget build(BuildContext context) {
    final RateAppController rateAppController = Get.put(RateAppController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: Container(
              padding: EdgeInsets.only(left: 5.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Get.offAndToNamed('/profile');
            },
          ),
        ),
        title: const Text('Share your feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'What is your opinion of GmStore?',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              itemSize: 45,
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Get.isDarkMode ? Colors.white60 : Colors.black,
              ),
              onRatingUpdate: (rating) {
                rateAppController.rating.value = rating.toString();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: rateAppController.comment,
                  maxLines: 12,
                  maxLength: 50,
                  decoration: InputDecoration(
                    counterText: '50 characters',
                    border: InputBorder.none,
                    hintText: 'Would you like to write anything about this product?',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      debugPrint("Back button pressed");
                      Get.offAndToNamed('/profile');
                    },
                    icon: ImageIcon(
                      AssetImage('assets/gallary.png'),
                      size: 60,
                      color: Get.isDarkMode ? Colors.white60 : Colors.black38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      debugPrint("Gallery button pressed");
                      rateAppController.getImage(ImageSource.gallery);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/camera.png'),
                      size: 60,
                      color: Get.isDarkMode ? Colors.white60 : Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
