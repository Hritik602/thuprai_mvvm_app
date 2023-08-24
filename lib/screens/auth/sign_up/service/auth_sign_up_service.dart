import 'package:thuprai_mvvm_test/network/api_error.dart';
import 'package:thuprai_mvvm_test/network/network_common.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';

class AuthSignUpService {
  static const String _signUpEndpoint = "/api/signup/";
  static const String _signInEndpoint = "/api/login/";

  Future<SignInResponse> signUpUser(SignUpRequest signUpRequest) async {
    try {
      var res = await NetworkCommon.dio
          .post(_signUpEndpoint, data: signUpRequest.toMap());
      return SignInResponse.fromJson(res.data);
    } catch (e) {
      return SignInResponse.withDioException(ApiError.fromDioError(e));
    }
  }

  Future<SignInResponse> signInUser(SignInRequest signInRequest) async {
    try {
      var res = await NetworkCommon.dio
          .post(_signInEndpoint, data: signInRequest.toMap());
      return SignInResponse.fromJson(res.data);
    } catch (e) {
      return SignInResponse.withDioException(ApiError.fromDioError(e));
    }
  }
}
