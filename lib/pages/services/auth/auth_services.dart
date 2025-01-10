// firebase auth
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //get the firebase instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email,password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signUp

  Future<UserCredential> signUpWithEmailAndPassword(
      String email,password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out\
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    
  }
  
}
