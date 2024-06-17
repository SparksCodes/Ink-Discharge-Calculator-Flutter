import 'package:flutter/material.dart';

class MainTittle extends StatelessWidget {
  const MainTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          'Ink Discharge Calculator',
          style: TextStyle(
            color: Color.fromARGB(255, 100, 100, 100),
            fontSize: 26,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
