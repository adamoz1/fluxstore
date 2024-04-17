import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RateAppController extends GetxController {
  var rating = ''.obs;
  TextEditingController comment = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      print('Selected image path: ${image.path}');
    }
  }
}