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
      And I tap "Submit"
      Then I should see 0.143
    */
    test("should give USD to BTC", () async {
      // your code here
      // at start, we expect to see "What coffee maker are you using?"
      final coffeeMakerQuestion = find.byValueKey('coffee-maker-question');
      expect(await driver.getText(coffeeMakerQuestion), "What coffee maker are you using?");

      // When I tap "French Press" And I tap "Continue"
      // we expect the prompt "How many cups would you like?"
      final frenchPressButton = find.byValueKey('french-press-btn');
      await driver.tap(frenchPressButton);
      final continueButton = find.byValueKey('continue-btn');
      await driver.tap(continueButton);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");

      // And I enter "5" And I tap "Continue"
      // we expect to be taken to the recommended screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      final recommended = find.byValueKey('recommended');
      expect(await driver.getText(recommended), "Recommended");

      // Then I should see "61g - course ground coffee" And I should see "851g - water"
      // we expect to see the correct calculation on the screen
      final coffeeGrounds = find.byValueKey('coffee-grounds');
      expect(await driver.getText(coffeeGrounds), "61g - course ground coffee");
      final waterInGrams = find.byValueKey('water-amount');
      expect (await driver.getText(waterInGrams), "851g - water");
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      // from the previous test, we should be on the recommended screen
      // we expect to see "What coffee maker are you using?" after clicking on "Done"
      final doneButton = find.byValueKey('done-btn');
      await driver.tap(doneButton);
      final coffeeMakerQuestion = find.byValueKey('coffee-maker-question');
      expect(await driver.getText(coffeeMakerQuestion), "What coffee maker are you using?");

      // When I tap "Drip Machine" And I tap "Continue"
      // we expect the prompt "How many cups would you like?"
      final dripMachineButton = find.byValueKey('drip-machine-btn');
      await driver.tap(dripMachineButton);
      final continueButton = find.byValueKey('continue-btn');
      await driver.tap(continueButton);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");

      // And I enter "5" And I tap "Continue"
      // we expect to be taken to the recommended screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      final recommended = find.byValueKey('recommended');
      expect(await driver.getText(recommended), "Recommended");

      // Then I should see "50g - medium ground coffee" And I should see "851g - water"
      // we expect to see the correct calculation on the screen
      final coffeeGrounds = find.byValueKey('coffee-grounds');
      expect(await driver.getText(coffeeGrounds), "50g - medium ground coffee");
      final waterInGrams = find.byValueKey('water-amount');
      expect (await driver.getText(waterInGrams), "851g - water");
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection", () async {
      //your code here
      // from the previous test, we should be on the machine selector screen 
      // we expect to see "What coffee maker are you using?" after clicking on "Done"
      final doneButton = find.byValueKey('done-btn');
      await driver.tap(doneButton);

      // we expect to remain in the choose device screen
      final continueButton = find.byValueKey('continue-btn');
      await driver.tap(continueButton);
      final coffeeMakerQuestion = find.byValueKey('coffee-maker-question');
      expect(await driver.getText(coffeeMakerQuestion), "What coffee maker are you using?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final frenchPressButton = find.byValueKey('french-press-btn');
      await driver.tap(frenchPressButton);
      final continueButton = find.byValueKey('continue-btn');
      await driver.tap(continueButton);
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount", () async {
      //your code here
      // from previous test, we should be in the Choose cups screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      // from previous test, we are in the choose cups screen
      // the following is done to reset the app at the choose machine screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('1');
      await driver.waitFor(find.text('1'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);

      // we expect to see the machine collector when we click on "Done"
      final doneButton = find.byValueKey('done-btn');
      await driver.tap(doneButton);
      final coffeeMakerQuestion = find.byValueKey('coffee-maker-question');
      expect(await driver.getText(coffeeMakerQuestion), "What coffee maker are you using?");


      // test user story
      final dripMachineButton = find.byValueKey('drip-machine-btn');
      await driver.tap(dripMachineButton);
      final continueButton = find.byValueKey('continue-btn');
      await driver.tap(continueButton);
      await driver.tap(continueButton2);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount", () async {
      //your code here
      // from previous test, we should be in the Choose cups screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");
    });

  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test('back button on recommended screen', () async {
      // from previous test, we should be on the cup amount screen
      // the following is done to set the app at recommended screen
      final textBox = find.byValueKey('text-box');
      await driver.tap(textBox);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('1');
      await driver.waitFor(find.text('1'));
      final continueButton2 = find.byValueKey('continue2-btn');
      await driver.tap(continueButton2);
      // we expect to be taken back to the cup amount screen
      final backButton = find.byValueKey('back-btn');
      await driver.tap(backButton);
      final numberOfCupsQuestion = find.byValueKey('cup-amount-question');
      expect(await driver.getText(numberOfCupsQuestion), "How many cups would you like?");
    });

    test('back button on cup amount screen', () async {
      // we expect to be taken back to machine selector screen
      final backButton = find.byValueKey('back-btn');
      await driver.tap(backButton);
      final coffeeMakerQuestion = find.byValueKey('coffee-maker-question');
      expect(await driver.getText(coffeeMakerQuestion), "What coffee maker are you using?");
    });
  });

}
