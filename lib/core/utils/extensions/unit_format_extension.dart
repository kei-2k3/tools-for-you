import 'package:tools_for_you/core/utils/shared_model/unit_model.dart';

extension UnitFormatter on double {
  String format({required UnitModel from, required UnitModel to}) {
    final factor = from.toBase / to.toBase;

    if (factor >= 1000) {
      return toStringAsFixed(0);
    } else if (factor < 0.01 && factor >= 0.001) {
      return toStringAsFixed(3);
    } else if (factor <= 0.001) {
      return toStringAsFixed(4);
    } else if (factor <= 0.01) {
      return toStringAsFixed(3);
    } else {
      return toStringAsFixed(2);
    }
  }
}
