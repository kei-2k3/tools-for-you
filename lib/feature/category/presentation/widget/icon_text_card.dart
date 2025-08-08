import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tool_kit_hub/core/helper/get_fa_icon.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';
import 'package:tool_kit_hub/feature/category/model/category_model.dart';

class IconTextCard extends StatelessWidget {
  const IconTextCard({
    super.key,
    required this.tool,
    this.onTap,
  });

  final ToolModel tool;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: isMobile ? 50 : 80,
                  height: isMobile ? 50 : 80,
                  decoration: BoxDecoration(
                    color: AppColor.kLessDarkBG,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: FaIcon(
                      getFaIcon(tool.iconName),
                      size: isMobile ? 15 : 36,
                      color: AppColor.kPrimary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: isMobile ? 21 : 30,
              child: Text(
                tool.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
