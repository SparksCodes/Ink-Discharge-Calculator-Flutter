import 'package:flutter/material.dart';

class MainNotifier extends ChangeNotifier {
  List<int> designSize = [10, 15, 20, 25, 30, 35, 40];
  List<int> designWidthResolution = [360, 400, 500, 600, 720];
  List<int> designLargeResolution = [360, 400, 500, 600, 720, 800, 900, 1000];
  List<int> dropLevel = [1, 2, 3, 4, 5, 6, 7, 8];
  List<int> printNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  num _desingSizeWidthSeleted = 10;
  num _desingSizeHeightSeleted = 10;
  num _designWidthResolutionSeleted = 360;
  num _designLargeResolutionSeleted = 360;
  num _dropLevelSeleted = 1;
  num _printNumberSeleted = 1;
  String _weight = '';
  String _inkDensity = '';
  num weightAsNumResult = 0;
  num inkDensityAsNumResult = 0;
  num discharge = 0;
  num drop = 0;
  
  num squareMillimeters = 10000;
  num picoLiters = 1000000000;
  num inchesSquares = 0.000645;

  num get desingSizeWidthSeleted => _desingSizeWidthSeleted;
  num get desingSizeHeightSeleted => _desingSizeHeightSeleted;
  num get designWidthResolutionSeleted => _designWidthResolutionSeleted;
  num get designLargeResolutionSeleted => _designLargeResolutionSeleted;
  num get dropLevelSeleted => _dropLevelSeleted;
  num get printNumberSeleted => _printNumberSeleted;
  String get weight => _weight;
  String get inkDensity => _inkDensity;

  set desingSizeWidthSeleted(num sizeWidthSeleted) {
    _desingSizeWidthSeleted = sizeWidthSeleted;
    notifyListeners();
  }

  set desingSizeHeightSeleted(num sizeHeightSeleted) {
    _desingSizeHeightSeleted = sizeHeightSeleted;
    notifyListeners();
  }

  set designWidthResolutionSeleted(num widthResolutionSeleted) {
    _designWidthResolutionSeleted = widthResolutionSeleted;
    notifyListeners();
  }

  set designLargeResolutionSeleted(num largeResolutionSeleted) {
    _designLargeResolutionSeleted = largeResolutionSeleted;
    notifyListeners();
  }

  set dropLevelSeleted(num dropSeleted) {
    _dropLevelSeleted = dropSeleted;
    notifyListeners();
  }

  set printNumberSeleted(num printSeleted) {
    _printNumberSeleted = printSeleted;
    notifyListeners();
  }

  set weight(String inputWeight) {
    _weight = inputWeight;
    notifyListeners();
  }

  set inkDensity(String inputInkDensity) {
    _inkDensity = inputInkDensity;
    notifyListeners();
  }

  num? weightAsNum() {
    try {
      final cleanedInput = _weight.replaceAll(',', '.');
      weightAsNumResult = num.parse(cleanedInput);
      return weightAsNumResult;
    } catch (e) {
      return null;
    }
  }

  num? inkDensityAsNum() {
    try {
      final inkDensityInput = _inkDensity.replaceAll(',', '.');
      inkDensityAsNumResult = num.parse(inkDensityInput);
      return inkDensityAsNumResult;
    } catch (e) {
      return null;
    }
  }

  num? dischargeCalculate() {
    discharge =
        ((weightAsNumResult / _printNumberSeleted) * squareMillimeters) /
            (_desingSizeWidthSeleted * _desingSizeHeightSeleted);

    notifyListeners();
    return discharge;
  }

  num? dropCalculate() {
    drop = ((((discharge /
                    ((_designWidthResolutionSeleted *
                            _designLargeResolutionSeleted) *
                        (1 / inchesSquares))) /
                inkDensityAsNumResult) *
            picoLiters) /
        _dropLevelSeleted);

    notifyListeners();
    return drop;
  }
}
