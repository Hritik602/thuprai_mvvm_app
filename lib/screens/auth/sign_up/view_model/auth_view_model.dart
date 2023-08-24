import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/repository/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  ///Create user / Sign up user.
  Future<SignInResponse> signUpUser(SignUpRequest signUpRequest) async {
    return await _authRepository.createUser(signUpRequest);
  }

  //User Login
  Future<SignInResponse> signInUser(SignInRequest signInRequest) async {
    return await _authRepository.signInUser(signInRequest);
  }
}
