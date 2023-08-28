import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/sign_in_response.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/model/signup_request.dart';
import 'package:thuprai_mvvm_test/screens/auth/sign_up/view_model/auth_view_model.dart';
import 'package:thuprai_mvvm_test/utils/app_alert_dialog.dart';
import 'package:thuprai_mvvm_test/utils/app_constant_text.dart';
import 'package:thuprai_mvvm_test/utils/app_routes.dart';
import 'package:thuprai_mvvm_test/utils/validator.dart';
import 'package:thuprai_mvvm_test/widget/input_textfield.dart';
import 'package:thuprai_mvvm_test/widget/password_text_form_field.dart';
import 'package:thuprai_mvvm_test/widget/primary_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20.sp),
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextfield(
                controller: _nameController,
                validator: (value) => Validator.validateName(value!),
                hintText: ConstantText.nameHintText,
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextfield(
                  controller: _emailController,
                  validator: (value) => Validator.validateEmail(value!),
                  hintText: ConstantText.emailHintText),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(
                controller: _passwordController,
                hintText: ConstantText.passwordHintText,
                validator: (value) => Validator.validatePassword(value!),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        buttonText: "Sign Up",
        onTap: () {
          _onClickSignUp();
        },
      ),
    );
  }

  void _onClickSignUp() async {
    if (_formKey.currentState!.validate()) {
      showLoadingIndicator(context);
      SignUpRequest signUpRequest = SignUpRequest(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      SignInResponse _signResponse =
          await context.read<AuthViewModel>().signUpUser(signUpRequest);
      dismissLoadingIndicator();
      if (_signResponse.dioExceptions == null) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, AppRoute.homeRoute);
      } else {
        dismissLoadingIndicator();
        if (!mounted) return;
        showErrorAlertDialog(context,
            onConfirmBtnTap: () {},
            message: _signResponse.dioExceptions?.message);
      }
    }
  }
}
