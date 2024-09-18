import 'package:firebase_auth/firebase_auth.dart';
import 'package:storytellerai/services/myUser.dart';

class AuthorizationService {
  final FirebaseAuth authKey = FirebaseAuth.instance;

  myUser? _userFromFireBaseUser(User user) {
    return user != null ? myUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<myUser?> get user {
    return authKey
        .authStateChanges()
        .map((User? user) => _userFromFireBaseUser(user!));
  }

  //sign in as a guest
  Future guestSignIn() async {
    try {
      UserCredential result = await authKey.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email and password

  //eventually implement sign in with google

  //register with email and password

  //sign out
}
