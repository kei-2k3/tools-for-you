import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_kit_hub/core/constant/app_string.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';
import 'package:tool_kit_hub/core/widgets/toggle_button/provider/toggle_provider.dart';

class KToggleButton extends ConsumerWidget {
  const KToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOn = ref.watch(toggleProvider);
    final toggleNotifier = ref.read(toggleProvider.notifier);

    return GestureDetector(
      onTap: () => toggleNotifier.toggle(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.kDarkBG,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isOn ? AppColor.kPrimary : AppColor.kOpposite,
            ),
            child: Center(
                child: Text(
              isOn ? on : off,
              style: Theme.of(context).textTheme.titleSmall,
            )),
          ),
        ),
      ),
    );
  }
}
