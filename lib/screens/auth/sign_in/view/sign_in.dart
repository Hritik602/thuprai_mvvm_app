import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_mvvm_test/core/color/app_color.dart';
import 'package:thuprai_mvvm_test/utils/app_alert_dialog.dart';
import 'package:thuprai_mvvm_test/utils/app_constant_text.dart';
import 'package:thuprai_mvvm_test/utils/app_routes.dart';
import 'package:thuprai_mvvm_test/utils/validator.dart';
import 'package:thuprai_mvvm_test/widget/input_textfield.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                InputTextfield(
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
    );
  }

  void _onTapSignUp() {
    ///Navigate to sign up screen
    Navigator.pushNamed(context, AppRoute.signUpRoute);
  }

  void _onSignIn() {
    if (_formKey.currentState!.validate()) {
      showLoadingIndicator(context);
    }
  }
}
