import 'package:flutter/material.dart';
import 'package:space_cats_app/utils/utils.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.title,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String hintText;
  final String title;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          obscureText: obscureText ?? false,
          maxLength: maxLength,
          keyboardType: keyboardType ?? TextInputType.name,
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
