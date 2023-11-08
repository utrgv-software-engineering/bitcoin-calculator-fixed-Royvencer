// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Happy Paths', () {
    /*
      Given I am on the Button select screen
      When I tap "USD to BTC"
      And I enter "5000"
      And I tap "Convert"
      Then I should see ""
    */
    test("should give conversion from USD to BTC", () async {
      // at start, we expect to see "Select Conversion Direction:"
      final selectQuestion = find.byValueKey('select-question');
      expect(await driver.getText(selectQuestion), "Select Conversion Direction:");

      // When I tap "USD to BTC"
      // we expect the prompt "Enter USD"
      final usdToBtcButton = find.byValueKey('USD-to-BTC-btn');
      await driver.tap(usdToBtcButton);
      expect(await driver.getText(find.text("Enter USD")), "Enter USD");

      // And I enter "5000" And I tap "Convert" Then I should see "0.14"
      // we expect to see the accurate conversion
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('5000');
      await driver.waitFor(find.text('5000'));
      final convertButton = find.byValueKey('convert-btn');
      await driver.tap(convertButton);
      final resultText = find.byValueKey('result-textbox');
      expect(await driver.getText(resultText), "0.14");
      await driver.tap(find.pageBack());
    });

    

  
    test("should give conversion from BTC to USD", () async {
      // at start, we expect to see "Select Conversion Direction:"
      final selectQuestion = find.byValueKey('select-question');
      expect(await driver.getText(selectQuestion), "Select Conversion Direction:");

      // When I tap "BTC to USD"
      // we expect the prompt "Enter BTC"
      final btcToUsdButton = find.byValueKey('BTC-to-USD-btn');
      await driver.tap(btcToUsdButton);
      expect(await driver.getText(find.text('Enter BTC')), 'Enter BTC');

      // And I enter "5" And I tap "Convert" Then I should see ""
      // we expect to see the accurate conversion
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      final convertButton = find.byValueKey('convert-btn');
      await driver.tap(convertButton);
      final resultText = find.byValueKey('result-textbox');
      expect(await driver.getText(resultText), "174405.00");
      await driver.tap(find.pageBack());
    });

  group('Sad Paths', () {
    /*
    Given I am on the Button select screen
    When I tap "USD to BTC"
    And I enter "-1"
    And I tap "Convert"
    Then I should see "Enter a valid USD value"
    */
    test("should not give conversion from USD to BTC for -1", () async {
      // at start, we expect to see "Select Conversion Direction:"
      final selectQuestion = find.byValueKey('select-question');
      expect(await driver.getText(selectQuestion), "Select Conversion Direction:");

      // When I tap "USD to BTC"
      // we expect the prompt "Enter USD"
      final usdToBtcButton = find.byValueKey('USD-to-BTC-btn');
      await driver.tap(usdToBtcButton);
      expect(await driver.getText(find.text("Enter USD")), "Enter USD");

      // And I enter "-1" And I tap "Convert" Then I should see "Enter a valid USD value"
      // we expect to see the error message
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      final convertButton = find.byValueKey('convert-btn');
      await driver.tap(convertButton);
      expect(await driver.getText(find.text("Enter a valid USD value")), "Enter a valid USD value");
      await driver.tap(find.pageBack());
    });

    /*
    Given I am on the Button select screen
    When I tap "BTC to USD"
    And I enter "-1"
    And I tap "Convert"
    Then I should see "Enter a valid BTC value"
    */
    test("should not give conversion from BTC to USD for -1", () async {
      // at start, we expect to see "Select Conversion Direction:"
      final selectQuestion = find.byValueKey('select-question');
      expect(await driver.getText(selectQuestion), "Select Conversion Direction:");

      // When I tap "BTC to USD"
      // we expect the prompt "Enter BTC"
      final btcToUsdButton = find.byValueKey('BTC-to-USD-btn');
      await driver.tap(btcToUsdButton);
      expect(await driver.getText(find.text("Enter BTC")), "Enter BTC");

      // And I enter "-1" And I tap "Convert" Then I should see "Enter a valid BTC value"
      // we expect to see the error message
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      final convertButton = find.byValueKey('convert-btn');
      await driver.tap(convertButton);
      expect(await driver.getText(find.text("Enter a valid BTC value")), "Enter a valid BTC value");
    });
  });

  });

}