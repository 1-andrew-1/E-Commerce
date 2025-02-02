import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class Countcontroller extends GetxController {
  RxInt count = 0.obs;
  void setcount(RxInt c) {
    count.value = c.value;
  }
  final PageController pageController = PageController(initialPage: 0);

  // Observable integer using GetX
  RxInt currentPage = 0.obs;
  RxBool changedcolorsoficon = false.obs ;
  void setcolorsoficon() {
    changedcolorsoficon.value = !changedcolorsoficon.value;
  }
  // Method to set the current page
  void setPage(RxInt c) {
    pageController.animateToPage(
      c.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  void pickImageFromGallery() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery); 
      if ( image != null) {
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }
}
