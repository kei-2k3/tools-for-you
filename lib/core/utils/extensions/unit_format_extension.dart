import 'package:tool_kit_hub/core/utils/shared/unit_model.dart';

extension UnitFormatter on double {
  String format({required UnitModel from, required UnitModel to}) {
    final factor = from.toBase / to.toBase;

    if (factor >= 1000) {
      return toStringAsFixed(0);
    } else if (factor < 0.000000001 && factor >= 0.0000000001) {
      return toStringAsFixed(10);
    } else if (factor < 0.00000001 && factor >= 0.000000001) {
      return toStringAsFixed(9);
    } else if (factor < 0.0000001 && factor >= 0.00000001) {
      return toStringAsFixed(8);
    } else if (factor < 0.000001 && factor >= 0.0000001) {
      return toStringAsFixed(7);
    } else if (factor < 0.00001 && factor >= 0.000001) {
      return toStringAsFixed(6);
    } else if (factor < 0.0001 && factor >= 0.00001) {
      return toStringAsFixed(5);
    } else if (factor < 0.001 && factor >= 0.0001) {
      return toStringAsFixed(4);
    } else if (factor < 0.01 && factor >= 0.001) {
      return toStringAsFixed(3);
    } else if (factor < 0.1 && factor >= 0.01) {
      return toStringAsFixed(2);
    } else {
      return toStringAsFixed(1);
    }
  }
}
