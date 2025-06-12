import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/widget/category_dropdown/category_dropdown.dart';

class UnitConvertorView extends ConsumerStatefulWidget {
  const UnitConvertorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UnitConvertorViewState();
}

class _UnitConvertorViewState extends ConsumerState<UnitConvertorView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.kLessDarkBG,
        width: context.screenWidth * 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const CategoryDropdown(),
              const SizedBox(height: 30),
              const KTextfield(),
              const Text('unit'),
              const SizedBox(height: 30),
              const Text('='),
              const SizedBox(height: 30),
              const KTextfield(),
              const Text('unit'),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: () {}, child: Text('Convert')),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
