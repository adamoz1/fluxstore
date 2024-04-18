import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxstore/controller/rateproduct_controller.dart';
import 'package:fluxstore/model/ProductFeedback.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class RateProduct extends StatefulWidget {
  const RateProduct({super.key});

  @override
  State<RateProduct> createState() => _RateProductState();
}

class _RateProductState extends State<RateProduct> {
  final RatepProductController ratepProController =
      Get.put(RatepProductController());

  void clear() {
    ratepProController.proRating.value = 0.0;
    ratepProController.proComment.clear();
    ratepProController.proImagesList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
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
              Get.offAndToNamed('/profile');
            },
          ),
        ),
        title: const Text('Rate Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.0, top: 30.0, right: 20.0),
              child: Container(
                // width: 740,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Get.isDarkMode ? Colors.white : Colors.black54,
                ),
                child: Center(
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage('assets/vector.png'),
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    title: Text(
                      'Submit your review to get 5 points',
                      style: TextStyle(
                        fontSize: 15,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'What is your opinion of GmStore?',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => RatingBar.builder(
                  itemSize: 45,
                  initialRating: ratepProController.proRating.value,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Get.isDarkMode ? Colors.white : Colors.green,
                  ),
                  onRatingUpdate: (rating) {
                    ratepProController.proRating.value = rating;
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            Card(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: ratepProController.proComment,
                  maxLines: 12,
                  maxLength: 50,
                  validator: (value) {
                    if (value == null) {
                      return "Please Enter the Comment";
                    }
                  },
                  decoration: const InputDecoration(
                      counterText: '50 characters',
                      border: InputBorder.none,
                      hintText:
                          'Would you like to write anything about this product?',
                      errorStyle: TextStyle(color: Colors.deepOrange)),
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
                      ratepProController.getImage(ImageSource.gallery);
                    },
                    icon: ImageIcon(
                      const AssetImage('assets/gallary.png'),
                      size: 60,
                      color: Get.isDarkMode ? Colors.white : Colors.black38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ratepProController.getImage(ImageSource.camera);
                    },
                    icon: ImageIcon(
                      const AssetImage('assets/camera.png'),
                      size: 60,
                      color: Get.isDarkMode ? Colors.white : Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? Colors.white : Colors.black),
                  onPressed: () {
                    final rating = ratepProController.proRating.value;
                    final comment = ratepProController.proComment.text.trim();

                    if (rating == 0.0) {
                      // Display error if rating is not provided
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please provide a rating'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (comment.isEmpty) {
                      // Display error if comment is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a comment'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final newReview = ProductFeedback(
                      rating: ratepProController.proRating
                          .value, // You need to set the rating value here
                      comment: ratepProController.proComment.text,
                      images: ratepProController.proImagesList,
                    );
                    ratepProController.review.add(newReview);
                    clear();
                    _showDialog();
                  },
                  child: Text(
                    'Submit Review',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero, // Ensure content takes up full space
          content: Container(
            width: 350, // Adjust the width as needed
            height: 250, // Adjust the height as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('assets/done.png'),
                  width: 81,
                  height: 81,
                ),
                SizedBox(height: 10),
                Text(
                  "Thank you for your feedback!",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 13),
                Text(
                  '''
  We appreciated your feedback. 
We’ll use your feedback to improve 
  your experience.
     ''',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
