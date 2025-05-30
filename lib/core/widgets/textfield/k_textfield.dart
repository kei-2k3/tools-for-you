import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

class KTextfield extends StatelessWidget {
  const KTextfield({super.key, this.keyboardType, this.controller});

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.number,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
      ),
    );
  }
}
