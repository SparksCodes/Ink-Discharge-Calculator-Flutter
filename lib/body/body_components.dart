import 'package:flutter/material.dart';
import 'package:ink_calculator/providers/main_notifier.dart';
import 'package:ink_calculator/widgets/main_button.dart';
import 'package:provider/provider.dart';
import '../widgets/select_row.dart';
import '../widgets/text_row.dart';

class BodyComponents extends StatefulWidget {
  const BodyComponents({super.key});

  @override
  State<BodyComponents> createState() => _BodyComponentsState();
}

class _BodyComponentsState extends State<BodyComponents> {
  @override
  Widget build(BuildContext context) {
    final designSize = context.read<MainNotifier>().designSize;
    final desingSizeWidthSeleted = context
        .select<MainNotifier, num>((value) => value.desingSizeWidthSeleted);
    final desingSizeHeightSeleted = context
        .select<MainNotifier, num>((value) => value.desingSizeHeightSeleted);

    final designWidthResolution =
        context.read<MainNotifier>().designWidthResolution;
    final designLargeResolution =
        context.read<MainNotifier>().designLargeResolution;
    final designWidthResolutionSeleted = context.select<MainNotifier, num>(
        (value) => value.designWidthResolutionSeleted);
    final designLargeResolutionSeleted = context.select<MainNotifier, num>(
        (value) => value.designLargeResolutionSeleted);

    final dropLevel = context.read<MainNotifier>().dropLevel;
    final printNumber = context.read<MainNotifier>().printNumber;
    final dropLevelSeleted =
        context.select<MainNotifier, num>((value) => value.dropLevelSeleted);
    final printNumberSeleted =
        context.select<MainNotifier, num>((value) => value.printNumberSeleted);

    final inkWeight = TextEditingController();
    final inkDensity = TextEditingController();

    context.select<MainNotifier, num>(
      (value) => value.weightAsNumResult,
    );

    context.select<MainNotifier, num>(
      (value) => value.discharge,
    );

    @override
    void dispose() {
      inkWeight.dispose();
      inkDensity.dispose();
      super.dispose();
    }

    return Column(
      children: [
        Center(
          child: SelectRow(
            mainTitle: 'Size width design',
            units: 'mm',
            selectedValue: desingSizeWidthSeleted,
            listValues: designSize,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().desingSizeWidthSeleted = newValue;
              }
            },
          ),
        ),
        Center(
          child: SelectRow(
            mainTitle: 'Size height design',
            units: 'mm',
            selectedValue: desingSizeHeightSeleted,
            listValues: designSize,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().desingSizeHeightSeleted = newValue;
              }
            },
          ),
        ),
        Center(
          child: SelectRow(
            mainTitle: 'Size width resolution',
            units: 'dpi',
            selectedValue: designWidthResolutionSeleted,
            listValues: designWidthResolution,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().designWidthResolutionSeleted =
                    newValue;
              }
            },
          ),
        ),
        Center(
          child: SelectRow(
            mainTitle: 'Size large resolution',
            units: 'dpi',
            selectedValue: designLargeResolutionSeleted,
            listValues: designLargeResolution,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().designLargeResolutionSeleted =
                    newValue;
              }
            },
          ),
        ),
        Center(
          child: SelectRow(
            mainTitle: 'Drop size',
            units: '',
            selectedValue: dropLevelSeleted,
            listValues: dropLevel,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().dropLevelSeleted = newValue;
              }
            },
          ),
        ),
        Center(
          child: SelectRow(
            mainTitle: 'Printting times',
            units: '',
            selectedValue: printNumberSeleted,
            listValues: printNumber,
            onChanged: (num? newValue) {
              if (newValue != null) {
                context.read<MainNotifier>().printNumberSeleted = newValue;
              }
            },
          ),
        ),
        Center(
          child: TextRow(
            mainTitle: 'Weight',
            units: 'gr',
            controllers: inkWeight,
            maxLenght: 6,
            onChanged: (text) {
              context.read<MainNotifier>().weight = text;
            },
          ),
        ),
        Center(
          child: TextRow(
            mainTitle: 'Ink Density',
            units: 'gr/ml',
            controllers: inkDensity,
            maxLenght: 4,
            onChanged: (text) {
              context.read<MainNotifier>().inkDensity = text;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 16)),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 180,
                  //color: Color.fromARGB(255, 15, 216, 15),
                  child: MainButton(
                    onPressed: () {
                      context.read<MainNotifier>().weightAsNum();
                      context.read<MainNotifier>().inkDensityAsNum();
                      context.read<MainNotifier>().dischargeCalculate();
                      context.read<MainNotifier>().dropCalculate();
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          const Column(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 110,
                                child: Center(
                                  child: Text(
                                    'Ink Discharge',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 100, 100, 100),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 110,
                                child: Center(
                                  child: Text(
                                    'gr/m2',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 40,
                              width: 80,
                              child: Center(
                                child: Text(
                                  '${context.read<MainNotifier>().discharge.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontFamily: 'Monstserrat',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 12)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          const Column(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 110,
                                child: Center(
                                  child: Text(
                                    'Drop Size',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 100, 100, 100),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 110,
                                child: Center(
                                  child: Text(
                                    'pl',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: 80,
                            child: Center(
                              child: Text(
                                '${context.read<MainNotifier>().drop.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontFamily: 'Monstserrat',
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
