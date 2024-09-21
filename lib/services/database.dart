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

  Future<String> fetchUsername() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("Username").doc(uid).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      return data['username'] as String;
    } else {
      return 'User not found'; // Or handle the case where the user doesn't exist
    }
  }
}
