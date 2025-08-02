import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tools_for_you/core/enums/tool_categories.dart';
import 'package:tools_for_you/core/enums/tool_types.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/category/model/category_model.dart';
import 'package:tools_for_you/feature/category/presentation/widget/icon_text_card.dart';
import 'package:tools_for_you/feature/home/presentation/provider/drawer_index_provider.dart';
import 'package:tools_for_you/feature/tool_entry/presentation/tool_entry_view.dart';

class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  ConsumerState<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  void _onDrawerItemTap(ToolTypes tool) {
    ref.read(drawerIndexProvider.notifier).setIndex(tool);
    ref.watch(drawerIndexProvider);

    Navigator.push(
      context,
      _createRoute(const ToolEntryView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final calculationTools = categories
        .firstWhere((c) => c.title == ToolCategories.calculation)
        .tools;
    final conversionTools = categories
        .firstWhere((c) => c.title == ToolCategories.conversion)
        .tools;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryTitle(context, 'CALCULATION'),
              _buildCategoryGridView(calculationTools)
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryTitle(context, 'CONVERSION'),
              _buildCategoryGridView(conversionTools)
            ],
          ),
        )
      ],
    );
  }

  Route _createRoute(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget _buildCategoryGridView(List<ToolModel> typeOfTool) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: typeOfTool.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 4 : 10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1),
        itemBuilder: (context, index) {
          final tool = typeOfTool[index];
          return IconTextCard(
            tool: tool,
            onTap: () {
              _onDrawerItemTap(tool.route);
              print(tool.route);
            },
          );
        },
      ),
    );
  }

  Padding _buildCategoryTitle(BuildContext context, String title) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColor.kPrimary, fontWeight: FontWeight.w600),
            ),
            Expanded(
                child: Divider(
              color: AppColor.kPrimary,
              height: 0.5,
            ))
          ],
        ));
  }
}
