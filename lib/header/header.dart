import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Image.asset(
              'lib/assets/drippinkLogo.png',
              alignment: Alignment.centerLeft,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/iniciales.png',
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
