import 'package:flutter/cupertino.dart';
import 'package:fluxstore/model/AppFeedback.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RateAppController extends GetxController {
  var review = <AppFeedback>[].obs;
  RxDouble rating = 0.0.obs;
  TextEditingController comment = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<String> imagesList = [];

  Future<void> getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      print('Selected image path: ${image.path}');

      imagesList.add(image.path);
    }
  }
}
