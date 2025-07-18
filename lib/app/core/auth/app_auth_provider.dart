import 'package:app_cripto/app/core/navigator/app_navigator.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppAuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  AppAuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserRepository userRepository,
  }) : _firebaseAuth = firebaseAuth,
       _userRepository = userRepository;

  Future<void> logout() => _userRepository.logout();

  User? get user => _firebaseAuth.currentUser;

  void loadListener() {
    _firebaseAuth.userChanges().listen((User? user) => notifyListeners());
    _firebaseAuth.idTokenChanges().listen((User? user) {
      if (user == null) {
        AppNavigator.to.pushNamedAndRemoveUntil('/login', (route) => false);
      } else {
        AppNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      }
    });
  }
}
