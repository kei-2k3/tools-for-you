extension FontHeightExtension on double {
  double get lineHeight {
    if (this <= 12) return 1.4;
    if (this <= 14) return 1.5;
    if (this <= 16) return 1.6;
    if (this <= 20) return 1.5;
    if (this <= 24) return 1.4;
    if (this <= 32) return 1.3;
    return 1.2;
  }
}
