import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/widgets/toggle_button/provider/toggle_provider.dart';

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
          color: AppColor.kLessDarkBG,
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
              color: AppColor.kPrimary,
            ),
            child: Center(
                child: Text(
              isOn ? 'ON' : 'OFF',
              style: Theme.of(context).textTheme.displayMedium,
            )),
          ),
        ),
      ),
    );
  }
}
