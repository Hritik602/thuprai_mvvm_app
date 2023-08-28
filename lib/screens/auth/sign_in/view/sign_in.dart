import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/core/color/app_color.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view_model/auth_view_model.dart';
import 'package:thuprai_mvvm_test/utils/app_alert_dialog.dart';
import 'package:thuprai_mvvm_test/utils/app_constant_text.dart';
import 'package:thuprai_mvvm_test/utils/app_routes.dart';
import 'package:thuprai_mvvm_test/utils/validator.dart';
import 'package:thuprai_mvvm_test/widget/input_textfield.dart';
import 'package:thuprai_mvvm_test/widget/password_text_form_field.dart';
import 'package:thuprai_mvvm_test/widget/primary_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sign In"),
                  SizedBox(
                    height: 0.04.sh,
                  ),
                  InputTextfield(
                      controller: _emailController,
                      hintText: ConstantText.emailHintText,
                      validator: (value) => Validator.validateEmail(value!)),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  PasswordTextField(
                      controller: _passwordController,
                      hintText: ConstantText.passwordHintText,
                      validator: (value) => Validator.validatePassword(value!)),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account?\t",
                        style: TextStyle(color: AppColors.lightBlack)),
                    TextSpan(
                        text: "SignUp",
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _onTapSignUp();
                          })
                  ]))
                ],
              ),
            )),
        bottomNavigationBar: PrimaryButton(
          onTap: _onSignIn,
          buttonText: "Sign In",
        ),
      ),
    );
  }

  void _onTapSignUp() {
    ///Navigate to sign up screen
    Navigator.pushNamed(context, AppRoute.signUpRoute);
  }

  void _onSignIn() async {
    if (_formKey.currentState!.validate()) {
      showLoadingIndicator(context);
      SignInRequest signInRequest = SignInRequest(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      SignInResponse _signInResponse =
          await context.read<AuthViewModel>().signInUser(signInRequest);
      if (_signInResponse.dioExceptions == null) {
        dismissLoadingIndicator();
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.homeRoute, (route) => false);
      } else {
        dismissLoadingIndicator();
        if (!mounted) return;
        showErrorAlertDialog(context,
            onConfirmBtnTap: () {},
            message: _signInResponse.dioExceptions?.message);
      }
    }
  }
}
