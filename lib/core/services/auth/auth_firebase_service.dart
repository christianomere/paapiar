import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';

class AuthFirebaseService implements AuthService {
  static PaapiarUser? _currentUser;
  static final _userStream = Stream<PaapiarUser?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for(final user in authChanges){
      _currentUser = user == null ? null : _toPaapiarUser(user);
      controller.add(_currentUser);
    }
   });

  PaapiarUser? get currentUser {
    return _currentUser;
  }

  Stream<PaapiarUser?> get userChanges {
    return _userStream;
  }

  Future<void> sigup(String name,
      String email,
      String password,
      File? image,) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password);

    if(credential.user == null) return;
    credential.user?.updateDisplayName(name);
    //credential.user?.updatePhotoURL(photoURL);
  }

  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password);
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  static PaapiarUser _toPaapiarUser(User user) {
    return PaapiarUser(
        id: user.uid,
        name: user.displayName ?? user.email!.split('@')[0],
        email: user.email!,
        imageURL: user.photoURL ?? 'assets/images/avatar.png'
    );
  }
}