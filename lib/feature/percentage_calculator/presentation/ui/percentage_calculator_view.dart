import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tool_kit_hub/core/constant/app_string.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';
import 'package:tool_kit_hub/core/utils/extensions/context_extension.dart';
import 'package:tool_kit_hub/core/widgets/textfield/k_textfield.dart';
import 'package:tool_kit_hub/core/widgets/toggle_button/provider/toggle_provider.dart';
import 'package:tool_kit_hub/core/widgets/toggle_button/toggle_button.dart';
import 'package:tool_kit_hub/feature/percentage_calculator/data/model/discount_result_model.dart';
import 'package:tool_kit_hub/feature/percentage_calculator/presentation/provider/discount_provider.dart';

class PercentageCalculatorView extends ConsumerStatefulWidget {
  const PercentageCalculatorView({super.key});

  @override
  ConsumerState<PercentageCalculatorView> createState() =>
      _PercentageCalculatorViewState();
}

class _PercentageCalculatorViewState
    extends ConsumerState<PercentageCalculatorView> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _percentController = TextEditingController();

  void _onInputChanged() {
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final percent = double.tryParse(_percentController.text) ?? 0.0;

    ref.read(discountCalculatorProvider.notifier).calculate(price, percent);
  }

  @override
  void initState() {
    super.initState();
    _priceController.addListener(_onInputChanged);
    _percentController.addListener(_onInputChanged);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _percentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(discountCalculatorProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        children: [
          _buildCalculatingSession(context),
          _buildResultSession(context, result)
        ],
      ),
    );
  }

  Widget _buildCalculatingSession(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kLessDarkBG,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.2, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: context.screenHeight * 0.01,
          children: [
            KTextfield(
              controller: _percentController,
            ),
            const Text(percentage),
            Gap(context.screenHeight * 0.01),
            const KToggleButton(),
            Gap(context.screenHeight * 0.01),
            KTextfield(
              controller: _priceController,
            ),
            const Text(amount)
          ],
        ),
      ),
    );
  }

  Widget _buildResultSession(BuildContext context, DiscountResultModel result) {
    final isOn = ref.read(toggleProvider);
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.kLessDarkBG,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        spacing: context.screenHeight * 0.02,
        children: [
          Text(result.finalPrice.toStringAsFixed(2),
              style: Theme.of(context).textTheme.titleMedium),
          RichText(
            text: TextSpan(
              text: isOn ? extraCost : youSaved,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColor.kPrimary),
              children: [
                TextSpan(text: result.extraPrice.toStringAsFixed(2)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Text _buildHeader() {
  //   return Text(
  //     percentageCalculator,
  //     style: Theme.of(context).textTheme.displayLarge,
  //   );
  // }
}
