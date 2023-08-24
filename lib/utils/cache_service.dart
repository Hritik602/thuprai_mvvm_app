import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  CacheService._();

  static const String tokenKey = "TokenKey";
  static const String userLoginResponseKey = "LoginResponseKey";
  static final CacheService _instance = CacheService._();
  factory CacheService() {
    return _instance;
  }
  static SharedPreferences? pref;
  static saveToken(String message) async {
    pref = await SharedPreferences.getInstance();
    pref?.setString(tokenKey, message);
  }

  static getToken(String key) async {
    pref = await SharedPreferences.getInstance();
    return pref?.getString(tokenKey);
  }

  // Future<void> saveUserLoginResponse(SignInResponse signInResponse)async{
  //   pref=await SharedPreferences.getInstance();
  //   pref?.setString(userLoginResponseKey, )
  // }
}
