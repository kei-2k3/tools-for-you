import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tool_kit_hub/core/theme/app_theme.dart';
import 'package:tool_kit_hub/feature/home/presentation/ui/home_view.dart';

void main() {
  debugPaintSizeEnabled;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Builder(
          builder: (context) {
            final theme = ResponsiveTheme.getTheme(context);

            return Theme(
              data: theme,
              child: child!,
            );
          },
        ),
        breakpoints: [
          const Breakpoint(start: 0, end: 460, name: MOBILE),
          const Breakpoint(start: 461, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
