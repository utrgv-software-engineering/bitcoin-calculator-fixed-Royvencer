import 'package:flutter/material.dart';

class USDToBTCConversionScreen extends StatefulWidget {
  @override
  _USDToBTCConversionScreenState createState() => _USDToBTCConversionScreenState();
}

class _USDToBTCConversionScreenState extends State<USDToBTCConversionScreen> {
  TextEditingController usdController = TextEditingController();
  String result = "";
  bool showErrorMessage = false;

  void convertUSDToBTC() {
    setState(() {
      showErrorMessage = false;
      try {
        double usdAmount = double.parse(usdController.text);
        
        if (usdAmount < 0) {
          // Handle negative input
          showErrorMessage = true;
          return;
        }

        double btcAmount = usdAmount / 34881; 
        result = btcAmount.toStringAsFixed(2); // Format to 2 decimal places
      } catch (e) {
        
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
              key: Key('text-box'),
              controller: usdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter USD",
                errorText: showErrorMessage ? "Enter a valid USD value" : null,
              ),
            ),
            ElevatedButton(
              key: Key('convert-btn'),
              onPressed: convertUSDToBTC,
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