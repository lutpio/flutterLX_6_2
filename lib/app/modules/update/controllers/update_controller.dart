import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  //TODO: Implement UpdateController

  late TextEditingController titleController;
  late TextEditingController timeController;
  late TextEditingController ingredientsController;
  late TextEditingController instructionsController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('resep').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String ingredients,
      String instructions, int timeEstimation) async {
    try {
      await firestore.collection('resep').doc(docID).update({
        'title': title,
        'time_estimation': timeEstimation,
        'ingredients': ingredients,
        'instructions': instructions,
      });

      Get.back();
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed updating data');
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
