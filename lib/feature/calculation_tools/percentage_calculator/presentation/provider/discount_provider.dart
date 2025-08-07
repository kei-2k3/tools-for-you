import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/core/widgets/toggle_button/provider/toggle_provider.dart';
import 'package:tools_for_you/feature/calculation_tools/percentage_calculator/data/model/discount_result_model.dart';

part 'discount_provider.g.dart';

@riverpod
class DiscountCalculator extends _$DiscountCalculator {
  @override
  DiscountResultModel build() {
    return DiscountResultModel(discountAmount: 0, finalPrice: 0, extraPrice: 0);
  }

  void calculate(double price, double percent) {
    final bool isToggleOn = ref.read(toggleProvider);

    final double discountAmount = (price * percent) / 100;
    final double finalPrice =
        isToggleOn ? price + discountAmount : price - discountAmount;
    final double extraPrice = discountAmount;

    state = DiscountResultModel(
      discountAmount: discountAmount,
      finalPrice: finalPrice,
      extraPrice: extraPrice,
    );
  }
}
