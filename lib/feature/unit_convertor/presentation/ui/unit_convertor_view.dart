import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';

class UnitConvertorView extends ConsumerStatefulWidget {
  const UnitConvertorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UnitConvertorViewState();
}

class _UnitConvertorViewState extends ConsumerState<UnitConvertorView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
    );
  }
}
