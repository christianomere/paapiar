import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService{
  static Map<String, PaapiarUser> _users = {};
  static PaapiarUser? _currentUser;
  static MultiStreamController<PaapiarUser?>? _controller;
  static final _userStream = Stream<PaapiarUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  PaapiarUser? get currentUser{
    return _currentUser;
  }

  Stream<PaapiarUser?> get userChanges {
    return _userStream;
  }

  Future<void> sigup(
      String name,
      String email,
      String password,
      File? image,
      ) async {
    final newUser = PaapiarUser(
        id: Random().nextDouble().toString(),
        name: name,
        email: email,
        imageURL: image?.path ?? 'assets/images/...'
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);

  }

  Future<void> login(
      String email, String password) async {
    _updateUser(_users[email]);
  }

  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(PaapiarUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}