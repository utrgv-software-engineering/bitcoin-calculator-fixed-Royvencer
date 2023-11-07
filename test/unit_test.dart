import 'package:bitcoin_calculator/utils/converter.dart';
import 'package:test/test.dart';

void main() {

  group('Value Testing', () {
    test('usd to btc', () {
      expect(Converter().usd_to_btc(5000.0), 0.14334);
    });
  });
  // group("setter functions", () {
  //   test('inputMachine with valid machine', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("French_Press");
  //     expect(test.selectedMachine, "French_Press");
  //   });

  //   test('inputMachine with invalid machine', () {
  //     final test = CoffeeTools();
  //     expect(() => test.inputMachine(""), throwsArgumentError);
  //   });

  //   test('inputCups with valid number', () {
  //     final test = CoffeeTools();
  //     test.inputCups(5);
  //     expect(test.userCups, 5);
  //   });

  //   test('inputCups with invalid number', () {
  //     final test = CoffeeTools();
  //     expect(() => test.inputCups(0), throwsArgumentError);
  //   });

  //   test('clearValues', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("French_Press");
  //     test.inputCups(5);
  //     test.clearValues();
  //     expect(test.selectedMachine, "");
  //     expect(test.userCups, 0);
  //   });

  // });

  // group("getter functions", () {
  //   test('currentMachine', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("French_Press");
  //     expect(test.currentMachine(), "French_Press");
  //   });

  //   test('currentCups', () {
  //     final test = CoffeeTools();
  //     test.inputCups(5);
  //     expect(test.currentCups(), 5);
  //   });

  //   test('coffeeAmountNeeded', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("Drip_Machine");
  //     test.inputCups(5);
  //     double result = test.coffeeAmountNeeded();
  //     expect(result, greaterThan(50));
  //     expect(result, lessThan(51));
  //   });

  //   test('waterNeeded', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("Drip_Machine");
  //     test.inputCups(5);
  //     double result = test.waterNeeded();
  //     expect(result, greaterThan(850));
  //     expect(result, lessThan(851));
  //   });

  //   test('coffeeGroundType', () {
  //     final test = CoffeeTools();
  //     test.inputMachine("Drip_Machine");
  //     expect(test.coffeeGroundType(), "medium ground coffee");
  //   });
  // });

  // group("cupsToOunces", () {
  //   test('calculates ounces on 1 cup', () {
  //     var ounces = CoffeeTools.cupsToOunces(1);
  //     expect(ounces, 6);
  //   });

  //   test('calculates ounces on positive number of cups', () {
  //     var ounces = CoffeeTools.cupsToOunces(4);
  //     expect(ounces, 24);
  //   });

  //   test('throws ArgumentError on zero', () {
  //     expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
  //   });

  //   test('throws ArgumentError on negative number', () {
  //     expect(() => CoffeeTools.cupsToOunces(-1), throwsArgumentError);
  //   });
  // });

  // group('cupsToGrams', () {
  //   test('calculates grams on 1 cup', () {
  //     var g = CoffeeTools.cupsToGrams(1);
  //     expect(g, greaterThan(170));
  //     expect(g, lessThan(171));
  //   });

  //   test('calculates grams on positive number of cups', () {
  //     var g = CoffeeTools.cupsToGrams(4);
  //     expect(g, greaterThan(680));
  //     expect(g, lessThan(681));
  //   });

  //   test('throws ArgumentError on zero', () {
  //     expect(() => CoffeeTools.cupsToGrams(0), throwsArgumentError);
  //   });

  //   test('throws ArgumentError on negative number', () {
  //     expect(() => CoffeeTools.cupsToGrams(-1), throwsArgumentError);
  //   });
  // });

  // group("calculateGrounds", () {
  //   test('calculates for French Press with 5 cups', () {
  //     var g = CoffeeTools.calculateGrounds("French_Press", 5);
  //     expect(g, greaterThan(60.0));
  //     expect(g, lessThan(61.0));
  //   });

  //   test('calculates for Drip Machine with 5 cups', () {
  //     var g = CoffeeTools.calculateGrounds("Drip_Machine", 5);
  //     expect(g, greaterThan(50.0));
  //     expect(g, lessThan(51.0));
  //   });

  //   test('throws ArgumentError on missing selected machine', () {
  //     expect(() => CoffeeTools.calculateGrounds("", 5), throwsArgumentError);
  //   });

  //   test('throws ArgumentError for missing cups', () {
  //     expect(() => CoffeeTools.calculateGrounds("Drip_Machine", 0), throwsArgumentError);
  //   });

  // });
}
