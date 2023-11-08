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
        
        if (btcAmount < 0) {
          // Handle negative input
          showErrorMessage = true;
          return;
        }

        // Implement your USD conversion logic here
        double usdAmount = btcAmount * 34881; 
        result = usdAmount.toStringAsFixed(2); // Format to 2 decimal places
      } catch (e) {
        
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
              key: Key('text-box'),
              controller: btcController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter BTC",
                errorText: showErrorMessage ? "Enter a valid BTC value" : null,
              ),
            ),
            ElevatedButton(
              key: Key('convert-btn'),
              onPressed: convertBTCToUSD,
              child: Text("Convert"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              key: Key('result-textbox'),
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