import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/feature/bmi_calculator/data/model/user_input_model.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/provider/bmi_provider.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/ui/widgets/age_dropdown.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/ui/widgets/gender_selector.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/ui/widgets/number_input_field.dart';

class BmiCalculatorView extends ConsumerStatefulWidget {
  const BmiCalculatorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BmiCalculatorViewState();
}

class _BmiCalculatorViewState extends ConsumerState<BmiCalculatorView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bmiCalculatorProvider);
    final notifier = ref.read(bmiCalculatorProvider.notifier);

    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBmiInputSession(context, state, notifier),
          _buildBmiResultSession(context, notifier),
        ],
      ),
    );
  }

  Padding _buildBmiInputSession(
      BuildContext context, UserInputModel state, BmiCalculator notifier) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.12, vertical: 40),
      child: Column(
        spacing: context.screenHeight * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberInputField(
            label: enterYourWeight,
            value: state.weight,
            onChanged: notifier.setWeight,
          ),
          NumberInputField(
            label: enterYourHeight,
            value: state.height,
            onChanged: notifier.setHeight,
          ),
          Text(
            chooseYourGender,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.kPrimary),
          ),
          const GenderSelector(),
          const AgeDropdown(),
        ],
      ),
    );
  }

  Expanded _buildBmiResultSession(
      BuildContext context, BmiCalculator notifier) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: AppColor.kLessDarkBG,
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: context.screenWidth * 0.12),
        child: Column(
          spacing: context.screenHeight * 0.016,
          children: [
            if (notifier.isInputComplete) ...[
              Text(
                'BMI: ${notifier.bmi.toStringAsFixed(2)}kg/m²',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.kPrimary, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  notifier.advice,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ] else ...[
              Text(
                muted,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
