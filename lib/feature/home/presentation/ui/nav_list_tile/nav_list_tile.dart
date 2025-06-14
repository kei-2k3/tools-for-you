import 'package:flutter/material.dart';
import 'package:tools_for_you/core/theme/app_color.dart';

class NavListTile extends StatelessWidget {
  const NavListTile(
      {super.key,
      required this.tileNo,
      required this.title,
      required this.selectedIndex,
      required this.onTap});
  final int tileNo;
  final int selectedIndex;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color:
                selectedIndex == tileNo ? AppColor.kPrimary : AppColor.kWhite),
      ),
      selected: selectedIndex == tileNo,
      onTap: onTap,
    );
  }
}
