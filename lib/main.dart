import 'package:flutter/material.dart';
import 'package:ink_calculator/providers/main_notifier.dart';
import 'package:ink_calculator/body/body_components.dart';
import 'package:ink_calculator/title/main_tittle.dart';
import 'package:provider/provider.dart';
import 'header/header.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainNotifier>(
      create: (BuildContext context) {
        return MainNotifier();
      },
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            home: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Header(),
                      MainTittle(),
                      BodyComponents(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
