import 'package:flutter/material.dart';

class USDToBTCConversionScreen extends StatefulWidget {
  @override
  _USDToBTCConversionScreenState createState() => _USDToBTCConversionScreenState();
}

class _USDToBTCConversionScreenState extends State<USDToBTCConversionScreen> {
  TextEditingController btcController = TextEditingController();
  String result = "";
  bool showErrorMessage = false;

  void convertUSDToBTC() {
    setState(() {
      showErrorMessage = false;
      try {
        double usdAmount = double.parse(btcController.text);
        // Implement your USD conversion logic here
        // For example, you can use a conversion rate to calculate USD
        double btcAmount = usdAmount / 34881; // Replace 50000 with the actual conversion rate. Current Rate $34881.00
        result = btcAmount.toStringAsFixed(2); // Format to 2 decimal places
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
        title: Text("USD to BTC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: btcController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter USD",
                errorText: showErrorMessage ? "Enter a valid USD value" : null,
              ),
            ),
            ElevatedButton(
              onPressed: convertUSDToBTC,
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
