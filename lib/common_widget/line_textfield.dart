import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class LineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String placeholder;
  final TextInputType? keyboardType;
  final Widget? right;
  final bool obscreText;
  final String? Function(String?)? validator;

  const LineTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.placeholder,
      this.right,
      this.keyboardType,
      this.obscreText = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: TColor.textTittle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscreText,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: right,
            focusedBorder: InputBorder.none,
            hintText: placeholder,
            hintStyle: TextStyle(color: TColor.placeholder, fontSize: 17),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          color: const Color(0xffE2E2E2),
        ),
      ],
    );
  }
}
