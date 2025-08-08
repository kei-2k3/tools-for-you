import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';
import 'package:tool_kit_hub/core/utils/extensions/tool_types_extension.dart';
import 'package:tool_kit_hub/feature/home/presentation/provider/drawer_index_provider.dart';

class ToolEntryView extends ConsumerWidget {
  const ToolEntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final selectedTool = ref.watch(drawerIndexProvider);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: AppColor.kDarkBG,
          title: Text(selectedTool.title),
          centerTitle: true,
        ),
        body: SafeArea(child: selectedTool.view));
  }
}
