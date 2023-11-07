import 'dart:ffi';

class Converter {
  // 34,881.30

  double usd_to_btc (double usd) {
    return usd / 34881.30;
  }

  double btc_to_usd (double btc) {
    return btc * 34881.30;
  }

  ///////////////////////////////////////
  // //setter functions
  // void inputMachine(String machine) {
  //   if (machine == "French_Press" || machine == "Drip_Machine") {
  //     selectedMachine = machine;
  //   } else {
  //     throw ArgumentError();
  //   }
  // }

  // void inputCups(int cups) {
  //   if (cups <= 0) throw ArgumentError();
  //   userCups = cups;
  // }

  // void clearValues() {
  //   selectedMachine = "";
  //   userCups = 0;
  // }

  // //getter functions
  // // return machine being used
  // String currentMachine() {
  //   return selectedMachine;
  // }

  // // return cups being made
  // int currentCups() {
  //   return userCups;
  // }

  // // returns coffee grounds needed
  // double coffeeAmountNeeded() {
  //   return calculateGrounds(selectedMachine, userCups);
  // }

  // // return water in grams
  // double waterNeeded() {
  //   return cupsToGrams(userCups);
  // }

  // String coffeeGroundType() {
  //   if (selectedMachine == "French_Press") {
  //     return "course ground coffee";
  //   } else if (selectedMachine == "Drip_Machine") {
  //     return "medium ground coffee";
  //   }
  //   return "";
  // }
  // ////////////////////////////////////////
  
  // // Input: number of cups (positive integer)
  // // Output: number of ounces in a cup
  // static int cupsToOunces(int cups) {
  //   if (cups <= 0) {
  //     throw ArgumentError();
  //   }
  //   return cups * 6;
  // }

  // static double cupsToGrams(int cups) {
  //   if (cups <= 0) {
  //     throw ArgumentError();
  //   }
  //   return cupsToOunces(cups) * 28.35;
  // }

  // static double calculateGrounds(String machine, int cups) {
  //   if (cups <= 0) throw ArgumentError();
  //   if (machine == "French_Press") {
  //     return cupsToGrams(cups) / 14.0;
  //   } else if (machine == "Drip_Machine") {
  //     return cupsToGrams(cups) / 17.0;
  //   }
  //   else {
  //     throw ArgumentError();
  //   }
  // }
}