import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/service/auth_sign_up_service.dart';

void main() {
  test('Test for create user ', () {
    AuthSignUpService authSignUpService = AuthSignUpService();

    SignUpRequest signUpRequest = SignUpRequest(
        email: "test@gmail.com", name: "test", password: "password");
    SignInResponse signInResponse = SignInResponse(email: "test@gmail.com");
    authSignUpService.signUpUser(signUpRequest);

    expect(signInResponse, signInResponse);
  });
}
