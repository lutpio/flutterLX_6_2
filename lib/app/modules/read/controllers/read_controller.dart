import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ReadController extends GetxController {
  //TODO: Implement ReadController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('resep').doc(docID);
    return docRef.get();
  }
}
