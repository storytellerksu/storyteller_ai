import 'package:firebase_auth/firebase_auth.dart';
import 'package:storytellerai/services/myUser.dart';

class AuthorizationService {
  final FirebaseAuth authKey = FirebaseAuth.instance;

  myUser? userIDFromUser(User user) {
    return myUser(uid: user.uid);
  }

  // auth change user stream
  Stream<myUser?> get user {
    return authKey
        .authStateChanges()
        .map((User? user) => userIDFromUser(user!));
  }

  //sign in as a guest
  Future guestSignIn() async {
    try {
      UserCredential result = await authKey.signInAnonymously();
      User? user = result.user;
      return userIDFromUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  // Below website has all the authorization errors
  //https://stackoverflow.com/questions/67617502/what-are-the-error-codes-for-flutter-firebase-auth-exception
  Future emailRegistration(String email, String password) async {
    try {
      UserCredential result = await authKey.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return userIDFromUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == "email-already-in-use") {
        return 1;
      } else if (e.code == "invalid-email") {
        return 2;
      } else {
        return null;
      }
    }
  }

  //sign in with email and password
  Future emailLogin(String email, String password) async {
    try {
      UserCredential result = await authKey.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return userIDFromUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return 1;
      } else {
        print(e.toString());
        return null;
      }
    }
  }

  //add google auth?

  //sign out
  Future logOut() async {
    try {
      print("signing out");
      return await authKey.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
