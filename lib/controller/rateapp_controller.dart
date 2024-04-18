import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:fluxstore/model/AppFeedback.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class RateAppController extends GetxController {
  var review = <AppFeedback>[].obs;
  RxDouble rating = 0.0.obs;
  TextEditingController comment = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<String> imagesList = [];

=======
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RateAppController extends GetxController {
  var rating = ''.obs;
  TextEditingController comment = TextEditingController();
  final ImagePicker _picker = ImagePicker();

>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
  Future<void> getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      print('Selected image path: ${image.path}');
<<<<<<< HEAD

      imagesList.add(image.path);
    }
  }
}
=======
    }
  }
}
>>>>>>> 08c7101a577dd6c603bb941a5a372696b848e436
