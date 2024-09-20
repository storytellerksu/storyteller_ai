import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection("User_Info");

  Future updateUserName(String username) async {
    return await userInfoCollection.doc(uid).set({
      "username": username,
    });
  }

  Future updateUserCategories(List categories) async {
    return await userInfoCollection.doc(uid).set({
      "categories": categories,
    });
  }
}
