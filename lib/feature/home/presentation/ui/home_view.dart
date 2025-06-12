import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/feature/about/presentation/ui/about_view.dart';
import 'package:tools_for_you/feature/bmi_calculator/presentation/ui/bmi_calculator_view.dart';
import 'package:tools_for_you/feature/contact/presentation/ui/contact_view.dart';
import 'package:tools_for_you/feature/home/presentation/provider/drawer_index_provider.dart';
import 'package:tools_for_you/feature/home/presentation/ui/nav_list_tile/nav_list_tile.dart';
import 'package:tools_for_you/feature/percentage_calculator/presentation/ui/percentage_calculator_view.dart';
import 'package:tools_for_you/feature/unit_convertor/presentation/ui/unit_convertor_view.dart';

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

    final pages = const [
      UnitConvertorView(),
      PercentageCalculatorView(),
      BmiCalculatorView()
    ];
    final titles = [unitConvertor, percentageCalculator, bmiCalculator];
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
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
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
          Expanded(
              child: Column(
            children: [
              NavListTile(
                  tileNo: 0,
                  selectedIndex: selectedIndex,
                  title: unitConvertor,
                  onTap: () => _onDrawerItemTap(0)),
              Divider(color: AppColor.kPrimary),
              NavListTile(
                  tileNo: 1,
                  title: percentageCalculator,
                  selectedIndex: selectedIndex,
                  onTap: () => _onDrawerItemTap(1)),
              NavListTile(
                  tileNo: 2,
                  selectedIndex: selectedIndex,
                  title: bmiCalculator,
                  onTap: () => _onDrawerItemTap(2)),
              Divider(color: AppColor.kPrimary),
            ],
          )),
          Divider(color: AppColor.kPrimary),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutView()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: AppColor.kWhite, size: 20),
                      SizedBox(width: 6),
                      Text(
                        about,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactView()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.mail_outline,
                          color: AppColor.kWhite, size: 20),
                      SizedBox(width: 6),
                      Text(
                        contact,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
