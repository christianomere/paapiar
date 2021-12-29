import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService{

  static final _defaultUser = PaapiarUser(
      id: '456',
      name: 'Igor',
      email: 'igor@test',
      imageURL: 'assets/images/avatar.png');

  static Map<String, PaapiarUser> _users = {
    _defaultUser.email: _defaultUser
  };
  static PaapiarUser? _currentUser;
  static MultiStreamController<PaapiarUser?>? _controller;
  static final _userStream = Stream<PaapiarUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
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
        imageURL: image?.path ?? 'assets/images/avatar.png'
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