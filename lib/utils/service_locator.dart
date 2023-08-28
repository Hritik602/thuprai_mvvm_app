import 'package:get_it/get_it.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view_model/auth_view_model.dart';
import 'package:thuprai_mvvm_test/screens/home/view_model/home_view_model.dart';

final serviceLocator = GetIt.instance;
void setUp() {
  serviceLocator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  serviceLocator.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
}
