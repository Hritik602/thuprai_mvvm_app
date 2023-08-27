import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_mvvm_test/network/api_error.dart';
import 'package:thuprai_mvvm_test/network/network_common.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/service/auth_sign_up_service.dart';

import 'auth_sign_up_service_test.mocks.dart';

@GenerateMocks([AuthSignUpService])
void main() {
  MockAuthSignUpService authSignUpService = MockAuthSignUpService();
  SignUpRequest signUpRequest = SignUpRequest(
      email: "test50@gmail.com", name: "test56", password: "password");

  SignInRequest signInRequest =
      SignInRequest(email: "test50@gmail.com", password: "password");
  SignInResponse signInResponse = SignInResponse(email: "test50@gmail.com");
  test('Test for create user ', () async {
//arrange
    when(authSignUpService.signUpUser(signUpRequest))
        .thenAnswer((_) => Future.value(SignInResponse()));

    final result = authSignUpService.signUpUser(signUpRequest);
    // assert
    expect(result, isInstanceOf<Future<SignInResponse>>());
  });

  test('Test for  sign in  user', () async {
    //arrange
    when(authSignUpService.signInUser(signInRequest))
        .thenAnswer((realInvocation) => Future.value(SignInResponse()));
    final result = authSignUpService.signInUser(signInRequest);
    //assert
    expect(result, same(result));
  });
}
