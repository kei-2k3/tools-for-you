import 'package:flutter/material.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/feature/category/presentation/category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () => scaffoldKey.currentState?.openDrawer(),
          //   icon: const Icon(Icons.menu),
          // ),
          title: Text(toolkithub),
          centerTitle: true,
        ),
        //drawer: _buildDrawer(titles, selectedIndex),
        body: CategoryView(),
      ),
    );
  }

  // Drawer _buildDrawer(List<String> titles, int selectedIndex) {
  //   return Drawer(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.zero,
  //         bottomRight: Radius.zero,
  //       ),
  //     ),
  //     child: Column(
  //       spacing: 10,
  //       children: [
  //         SizedBox(
  //           width: double.infinity,
  //           height: 70,
  //           child: DrawerHeader(
  //             margin: EdgeInsets.only(bottom: 10),
  //             padding: const EdgeInsets.all(16),
  //             decoration: BoxDecoration(
  //                 // border: Border(
  //                 //   bottom: BorderSide(color: AppColor.kPrimary, width: 1),
  //                 // ),
  //                 ),
  //             child: Text(
  //               toolkithub,
  //               style: Theme.of(context).appBarTheme.titleTextStyle,
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //             child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             _buildCategoryTitle(),
  //             NavListTile(
  //                 tileNo: 0,
  //                 title: percentageCalculator,
  //                 selectedIndex: selectedIndex,
  //                 onTap: () => _onDrawerItemTap(0)),
  //             NavListTile(
  //                 tileNo: 1,
  //                 selectedIndex: selectedIndex,
  //                 title: bmiCalculator,
  //                 onTap: () => _onDrawerItemTap(1)),
  //             NavListTile(
  //                 tileNo: 2,
  //                 selectedIndex: selectedIndex,
  //                 title: unitConverter,
  //                 onTap: () => _onDrawerItemTap(2)),
  //           ],
  //         )),
  //         Divider(color: AppColor.kPrimary),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             spacing: 20,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => AboutView()),
  //                   );
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.info_outline,
  //                         color: AppColor.kWhite, size: 20),
  //                     SizedBox(width: 6),
  //                     Text(
  //                       aboutCap,
  //                       style: Theme.of(context).textTheme.bodyMedium,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => ContactView()),
  //                   );
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.mail_outline,
  //                         color: AppColor.kWhite, size: 20),
  //                     SizedBox(width: 6),
  //                     Text(
  //                       contactCap,
  //                       style: Theme.of(context).textTheme.bodyMedium,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCategoryTitle() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15),
  //     child: Text(
  //       'Calculator',
  //       style: Theme.of(context)
  //           .textTheme
  //           .titleSmall
  //           ?.copyWith(color: AppColor.kPrimary),
  //     ),
  //   );
  // }
}
