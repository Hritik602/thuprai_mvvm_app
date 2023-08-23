import 'package:thuprai_mvvm_test/network/api_error.dart';
import 'package:thuprai_mvvm_test/network/network_common.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';

class AuthSignUpService {
  static const String _signupEnpoint = "/api/signup/";

  Future<SignInResponse> signUpUser(SignUpRequest signUpRequest) async {
    try {
      var res = await NetworkCommon.dio
          .post(_signupEnpoint, data: signUpRequest.toMap());
      return SignInResponse.fromJson(res.data);
    } catch (e) {
      return SignInResponse.withDioException(e as DioExceptions);
    }
  }
}
