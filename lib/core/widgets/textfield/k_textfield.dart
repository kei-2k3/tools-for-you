import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

class KTextfield extends StatelessWidget {
  const KTextfield(
      {super.key,
      this.keyboardType,
      this.controller,
      this.enabled = true,
      this.maxLines,
      this.hintText,
      this.labelText,
      this.hintTextStyle,
      this.floatingLabelStyle,
      this.onChanged});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool enabled;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintTextStyle;
  final TextStyle? floatingLabelStyle;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.number,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelStyle:
            floatingLabelStyle ?? TextStyle(color: AppColor.kPrimary),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kPrimary),
        ),
      ),
    );
  }
}
