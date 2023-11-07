import 'package:flutter/material.dart';

class BTCToUSDConversionScreen extends StatefulWidget {
  @override
  _BTCToUSDConversionScreenState createState() => _BTCToUSDConversionScreenState();
}

class _BTCToUSDConversionScreenState extends State<BTCToUSDConversionScreen> {
  TextEditingController btcController = TextEditingController();
  String result = "";
  bool showErrorMessage = false;

  void convertBTCToUSD() {
    setState(() {
      showErrorMessage = false;
      try {
        double btcAmount = double.parse(btcController.text);
        // Implement your USD conversion logic here
        // For example, you can use a conversion rate to calculate USD
        double usdAmount = btcAmount * 34881; // Replace 50000 with the actual conversion rate. Current Rate $34881.00
        result = usdAmount.toStringAsFixed(2); // Format to 2 decimal places
      } catch (e) {
        // Handle invalid input
        showErrorMessage = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC to USD Conversion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: btcController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter BTC",
                errorText: showErrorMessage ? "Enter a valid BTC value" : null,
              ),
            ),
            ElevatedButton(
              onPressed: convertBTCToUSD,
              child: Text("Convert"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                color: showErrorMessage ? Colors.red : Colors.green,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}