import 'package:flutter/material.dart';

class InputTextfield extends StatelessWidget {
  const InputTextfield({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    required this.hintText,
    required this.validator,
    this.textInputType,
  }) : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
          keyboardType: textInputType ?? TextInputType.text,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              isDense: true,
              hintText: hintText ?? "",
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
