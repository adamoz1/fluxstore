import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxstore/controller/rateapp_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

<<<<<<< HEAD
import '../model/AppFeedback.dart';

=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
class RateAppPage extends StatefulWidget {
  const RateAppPage({Key? key}) : super(key: key);

  @override
  State<RateAppPage> createState() => _RateAppPageState();
}

class _RateAppPageState extends State<RateAppPage> {
<<<<<<< HEAD
  final RateAppController rateAppController = Get.put(RateAppController());

  void clear(){
    rateAppController.rating.value = 0.0;
    rateAppController.comment.clear();
    rateAppController.imagesList = [];
  }

  @override
  Widget build(BuildContext context) {
=======
  @override
  Widget build(BuildContext context) {
    final RateAppController rateAppController = Get.put(RateAppController());
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: Container(
<<<<<<< HEAD
              padding: const EdgeInsets.only(left: 5.0),
=======
              padding: EdgeInsets.only(left: 5.0),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
<<<<<<< HEAD
              child: const Icon(Icons.arrow_back_ios),
=======
              child: Icon(Icons.arrow_back_ios),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
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
<<<<<<< HEAD
              initialRating: rateAppController.rating.value,
=======
              initialRating: 4,
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
<<<<<<< HEAD
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
=======
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              onRatingUpdate: (rating) {
<<<<<<< HEAD
                rateAppController.rating.value = rating;
=======
                rateAppController.rating.value = rating.toString();
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
<<<<<<< HEAD
              margin: const EdgeInsets.only(right: 30, left: 30),
=======
              margin: EdgeInsets.only(right: 30, left: 30),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: rateAppController.comment,
                  maxLines: 12,
                  maxLength: 50,
<<<<<<< HEAD
                  decoration: const InputDecoration(
                    counterText: '50 characters',
                    border: InputBorder.none,
                    hintText:
                        'Would you like to write anything about this product?',
=======
                  decoration: InputDecoration(
                    counterText: '50 characters',
                    border: InputBorder.none,
                    hintText: 'Would you like to write anything about this product?',
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
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
<<<<<<< HEAD
                      rateAppController.getImage(ImageSource.gallery);
                    },
                    icon: ImageIcon(
                      const AssetImage('assets/gallary.png'),
=======
                      debugPrint("Back button pressed");
                      Get.offAndToNamed('/profile');
                    },
                    icon: ImageIcon(
                      AssetImage('assets/gallary.png'),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
                      size: 60,
                      color: Get.isDarkMode ? Colors.white : Colors.black38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
<<<<<<< HEAD
                      rateAppController.getImage(ImageSource.camera);
                    },
                    icon: ImageIcon(
                      const AssetImage('assets/camera.png'),
=======
                      debugPrint("Gallery button pressed");
                      rateAppController.getImage(ImageSource.gallery);
                    },
                    icon: ImageIcon(
                      AssetImage('assets/camera.png'),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
                      size: 60,
                      color: Get.isDarkMode ? Colors.white : Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            const SizedBox(
=======
            SizedBox(
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
<<<<<<< HEAD
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? Colors.white : Colors.black),
                  onPressed: () {

                    final rating = rateAppController.rating.value;
                    final comment = rateAppController.comment.text.trim();

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

                    final newReview = AppFeedback(
                      rating: rateAppController.rating.value, // You need to set the rating value here
                      comment: rateAppController.comment.text,
                      images: rateAppController.imagesList,
                    );
                    rateAppController.review.add(newReview);
                    clear();

                    _showDialog();
                  },
                  child: Text(
                    'Submit Review',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  )),
=======
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.isDarkMode ? Colors.white : Colors.black
                ),
                  onPressed: (){

              }, child: Text('Submit Review',style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),)),
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
            )
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD


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
=======
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
}
