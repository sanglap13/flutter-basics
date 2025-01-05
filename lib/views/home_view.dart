import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 31, 31),
        body: SafeArea(
          child: CalculatorView(),
        )
      );
  }
}