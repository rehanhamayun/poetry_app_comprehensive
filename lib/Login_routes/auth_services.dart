import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shakespear_app/Login_routes/user_model.dart';
class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userfromFirebase(auth.User? user){
    if(user==null){
      return null;
    }

    return User(user.uid, user.email.toString());
  }

  Stream<User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userfromFirebase);
  }

  Future<User?> signInWithEmailAndPassword (String email, String password) async{
    final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userfromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userfromFirebase(credential.user);
  }

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }





}
