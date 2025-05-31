import 'package:flutter/material.dart';
import 'package:tools_for_you/feature/percentage_calculator/presentation/ui/percentage_calculator_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    PercentageCalculatorView(),
    PercentageCalculatorView(),
    PercentageCalculatorView(),
  ];

  void _onWidgetTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calculator'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calculator'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onWidgetTapped,
      ),
    );
  }
}
