import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference usernameCollection =
      FirebaseFirestore.instance.collection("Username");

  final CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("Categories");

  Future updateUserName(String username) async {
    return await usernameCollection.doc(uid).set({
      "username": username,
    });
  }

  Future updateUserCategories(List categories) async {
    return await categoriesCollection.doc(uid).set({
      "categories": categories,
    });
  }
}
