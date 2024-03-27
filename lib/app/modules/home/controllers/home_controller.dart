import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tugas6_2/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('resep');
    return data.orderBy('create_at', descending: true).snapshots();
  }

  void deleteData(String docID) {
    try {
      Get.defaultDialog(
          title: "Delete resep",
          middleText: "Are you sure you want to delete this resep?",
          onConfirm: () async {
            await firestore.collection('resep').doc(docID).delete();
            Get.back();
            Get.snackbar('Success', 'Resep deleted successfully');
          },
          textConfirm: "Yes, I'm sure",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Cannot delete this resep');
    }
  }
}
