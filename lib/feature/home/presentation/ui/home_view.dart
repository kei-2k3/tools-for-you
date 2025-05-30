import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/utils/extensions/context_extension.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';
import 'package:tools_for_you/core/widgets/toggle_button/toggle_button.dart';
import 'package:tools_for_you/feature/home/presentation/provider/discount_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(context.screenHeight * 0.1),
              const Text(
                'Percentage Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.2, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: context.screenHeight * 0.01,
                  children: [
                    KTextfield(
                      controller: _percentController,
                    ),
                    Text('% (Percentage)'),
                    Gap(context.screenHeight * 0.02),
                    KToggleButton(),
                    Gap(context.screenHeight * 0.02),
                    KTextfield(
                      controller: _priceController,
                    ),
                    Text('Amount (Price)')
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      width: context.screenWidth,
                      color: AppColor.kLessDarkBG,
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        spacing: context.screenHeight * 0.02,
                        children: [
                          Text(result.finalPrice.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.displayLarge),
                          Text(
                              'You Saved: ${result.savedPrice.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.displayMedium),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
