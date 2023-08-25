import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/repository/auth_repo.dart';
import 'package:thuprai_mvvm_test/utils/cache_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  ///Create user / Sign up user.
  Future<SignInResponse> signUpUser(SignUpRequest signUpRequest) async {
    SignInResponse _signInResponse =
        await _authRepository.createUser(signUpRequest);
    saveUserLoginResponse(_signInResponse.token);
    return _signInResponse;
  }

  //User Login
  Future<SignInResponse> signInUser(SignInRequest signInRequest) async {
    SignInResponse _signInResponse =
        await _authRepository.signInUser(signInRequest);
    saveUserLoginResponse(_signInResponse.token);
    return _signInResponse;
  }

//Save  User token in share pref.
  void saveUserLoginResponse(String? token) {
    if (token == null) return;
    CacheService.saveToken(token);
  }
}
