import 'package:flutter/material.dart';

class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({
    super.key,
    required this.selectedValue,
    required this.listValues,
    required this.onChanged,
  });

  final num? selectedValue;
  final List<num> listValues;
  final ValueChanged<num?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<num>(
      value: selectedValue,
      icon: Flexible(
          child: Container(
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.arrow_drop_down_outlined,
              ))),
      elevation: 10,
      style: const TextStyle(
        color: Color.fromARGB(255, 100, 100, 100),
        fontFamily: 'Montserrat',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      underline: Container(
        width: 75,
        height: 1.5,
        color: const Color.fromARGB(150, 100, 100, 100),
      ),
      onChanged: onChanged,
      items: listValues.map<DropdownMenuItem<num>>((num value) {
        return DropdownMenuItem<num>(
          value: value,
          alignment: Alignment.center,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
