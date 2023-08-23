import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/service/auth_sign_up_service.dart';

abstract class IAuthRepository {
  Future<SignInResponse> createUser(SignUpRequest signUpRequest);
}

class AuthRepository extends IAuthRepository {
  final AuthSignUpService _authSignUpService = AuthSignUpService();
  @override
  Future<SignInResponse> createUser(SignUpRequest signUpRequest) async {
    return await _authSignUpService.signUpUser(signUpRequest);
  }
}
