import 'dart:ffi';
import 'package:bitcoin_calculator/config/globals.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/utils/converter_API_ADDED.dart';
class USDToBTCConversionScreen extends StatefulWidget {
  @override
  _USDToBTCConversionScreenState createState() => _USDToBTCConversionScreenState();
}

class _USDToBTCConversionScreenState extends State<USDToBTCConversionScreen> {
  TextEditingController usdController = TextEditingController();
  String result = "";
  bool showErrorMessage = false;
  Future<Map<String, dynamic>> currentBTC;
  double btcRate;

  void convertUSDToBTC(double btcRate) {
    setState(() {
      showErrorMessage = false;
      try {
        double usdAmount = double.parse(usdController.text);
        
        if (usdAmount < 0) {
          // Handle negative input
          showErrorMessage = true;
          return;
        }

        double btcAmount = usdAmount / btcRate; 
        result = btcAmount.toStringAsFixed(2); 
      } catch (e) {
        showErrorMessage = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentBTC = CoindeskAPI.fetchBitcoinPrice(httpClient);
    currentBTC.then((bitcoinData) {
      if (bitcoinData.containsKey('bpi') && bitcoinData['bpi'].containsKey('USD')) {
        btcRate = bitcoinData['bpi']['USD']['rate_float'];
        convertUSDToBTC(btcRate);
      } else {
        showErrorMessage = true;
      }
    }).catchError((error) {
      print(error);
      showErrorMessage = true;
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
              onPressed: () => convertUSDToBTC(btcRate),
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