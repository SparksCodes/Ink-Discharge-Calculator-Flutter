import 'package:flutter/material.dart';
import 'drop_drown_bottom.dart';

class SelectRow extends StatelessWidget {
  const SelectRow({
    super.key,
    required this.mainTitle,
    required this.units,
    required this.selectedValue,
    required this.listValues,
    required this.onChanged,
  });

  final String mainTitle;
  final String units;
  final num? selectedValue;
  final List<num> listValues;
  final ValueChanged<num?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
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
          child: DropdownButtonExample(
            selectedValue: selectedValue,
            listValues: listValues,
            onChanged: onChanged,
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
