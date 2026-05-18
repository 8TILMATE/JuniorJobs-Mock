import 'package:flutter/foundation.dart';

import '../repositories/auth_repository.dart';

enum AuthMode { login, signup }

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  AuthMode _mode = AuthMode.login;
  bool _isBusy = false;
  bool _isAuthenticated = false;

  AuthMode get mode => _mode;
  bool get isBusy => _isBusy;
  bool get isAuthenticated => _isAuthenticated;

  void showLogin() {
    _mode = AuthMode.login;
    notifyListeners();
  }

  void showSignup() {
    _mode = AuthMode.signup;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isBusy = true;
    notifyListeners();
    await _repository.signIn(email: email, password: password);
    _isBusy = false;
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    _isBusy = true;
    notifyListeners();
    await _repository.signUp(name: name, email: email, password: password);
    _isBusy = false;
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _mode = AuthMode.login;
    notifyListeners();
  }
}
