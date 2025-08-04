import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getFaIcon(String name) {
  switch (name) {
    case 'percent':
      return FontAwesomeIcons.percent;
    case 'weightScale':
      return FontAwesomeIcons.weightScale;
    case 'rightLeft':
      return FontAwesomeIcons.rightLeft;
    case 'coins':
      return FontAwesomeIcons.coins;
    default:
      return FontAwesomeIcons.question;
  }
}
