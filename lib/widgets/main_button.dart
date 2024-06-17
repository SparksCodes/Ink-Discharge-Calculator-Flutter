import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 90,
          width: Checkbox.width,
          child: Stack(
            children: [
              Positioned(
                top: 8,
                left: 8,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 28,
                  width: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 10,
                        color: const Color.fromARGB(255, 77, 77, 77)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4, color: const Color.fromARGB(255, 77, 77, 77)),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
