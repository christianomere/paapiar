import 'dart:io';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'package:paapiar/core/services/auth/auth_firebase_service.dart';

abstract class AuthService {
  PaapiarUser? get currentUser;
  Stream<PaapiarUser?> get userChanges;

  Future<void> sigup(
      String name,
      String email,
      String password,
      File? image,
      );

  Future<void> login(
      String email,
      String password,
      );

  Future<void> logout();

  factory AuthService(){
    return AuthFirebaseService();
    //return AuthMockService();
  }
}