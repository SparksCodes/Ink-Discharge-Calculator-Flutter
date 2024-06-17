import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  TextRow({
    super.key,
    required this.mainTitle,
    required this.units,
    required this.controllers,
    required this.maxLenght,
    required this.onChanged,
  });

  final String mainTitle;
  final String units;
  late TextEditingController controllers;
  final int maxLenght;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 10),
          child: SizedBox(
            width: 220,
            child: Text(
              mainTitle,
              style: const TextStyle(
                color: Color.fromARGB(255, 100, 100, 100),
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 70,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            style: const TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
            cursorColor: const Color.fromARGB(255, 100, 100, 100),
            cursorWidth: 2,
            maxLength: maxLenght,
            controller: controllers,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    style: BorderStyle.solid),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
            units,
            style: const TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
