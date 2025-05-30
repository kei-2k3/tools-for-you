import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tools_for_you/feature/home/data/model/discount_result_model.dart';

part 'discount_provider.g.dart';

@riverpod
class DiscountCalculator extends _$DiscountCalculator {
  @override
  DiscountResultModel build() {
    return DiscountResultModel(discountAmount: 0, finalPrice: 0, savedPrice: 0);
  }

  void calculate(double price, double percent) {
    final double discountAmount = (price * percent) / 100;
    final double finalPrice = price - discountAmount;
    final double savedPrice = discountAmount;

    state = DiscountResultModel(
      discountAmount: discountAmount,
      finalPrice: finalPrice,
      savedPrice: savedPrice,
    );
  }
}
