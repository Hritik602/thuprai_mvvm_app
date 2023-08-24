// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _passwordVisibility;

  @override
  void initState() {
    super.initState();
    _passwordVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.06.sh,
      child: TextFormField(
          obscureText: _passwordVisibility,
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: _passwordVisibility
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordVisibility = !_passwordVisibility;
                  });
                },
              ),
              hintText: widget.hintText ?? "",
              hintStyle: Theme.of(context).textTheme.labelSmall,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
