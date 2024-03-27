import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  //TODO: Implement CreateController

  late TextEditingController titleController;
  late TextEditingController timeController;
  late TextEditingController ingredientsController;
  late TextEditingController instructionsController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String ingredients, String instructions,
      int timeEstimation) async {
    try {
      String dateNow = DateTime.now().toString();
      await firestore.collection('resep').add({
        'title': title,
        'time_estimation': timeEstimation,
        'ingredients': ingredients,
        'instructions': instructions,
        'create_at': dateNow
      });
      // await firestore
      //     .collection('posts')
      //     .add({'title': title, 'description': description, 'time': dateNow});

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      timeController.clear();
      ingredientsController.clear();
      instructionsController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    timeController = TextEditingController();
    ingredientsController = TextEditingController();
    instructionsController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    timeController.dispose();
    ingredientsController.dispose();
    instructionsController.dispose();
    super.onClose();
  }
}
