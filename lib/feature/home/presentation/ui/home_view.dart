import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/home/presentation/provider/drawer_index_provider.dart';
import 'package:tools_for_you/feature/percentage_calculator/presentation/ui/percentage_calculator_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  void _onDrawerItemTap(int index) {
    ref.read(drawerIndexProvider.notifier).setIndex(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final pages = const [PercentageCalculatorView()];
    final titles = [percentageCalculator];
    final selectedIndex = ref.watch(drawerIndexProvider);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
        title: Text(titles[selectedIndex]),
        centerTitle: true,
      ),
      drawer: _buildDrawer(titles, selectedIndex),
      body: pages[selectedIndex],
    );
  }

  Drawer _buildDrawer(List<String> titles, int selectedIndex) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 70,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColor.kPrimary, width: 1),
                ),
              ),
              child: Text(
                tools4u,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
          for (int i = 0; i < titles.length; i++)
            ListTile(
              title: Text(
                titles[i],
                style: selectedIndex == i
                    ? TextStyle(
                        fontSize: 18,
                        color: AppColor.kPrimary,
                      )
                    : TextStyle(
                        fontSize: 18,
                        color: AppColor.kWhite,
                      ),
              ),
              selected: selectedIndex == i,
              onTap: () => _onDrawerItemTap(i),
            ),
        ],
      ),
    );
  }
}
