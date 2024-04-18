import 'package:flutter/material.dart';
import 'package:fluxstore/model/ProductFeedback.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RatepProductController extends GetxController{
  var review = <ProductFeedback>[].obs;
  RxDouble proRating = 0.0.obs;
  TextEditingController proComment = TextEditingController();
  final ImagePicker _proPicker = ImagePicker();

  List<String> proImagesList = [];


  Future<void> getImage(ImageSource source) async {
    final XFile? image = await _proPicker.pickImage(source: source);
    if (image != null) {
      print('Selected image path: ${image.path}');

      proImagesList.add(image.path);
    }
  }
}