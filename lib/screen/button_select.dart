import 'package:bitcoin_calculator/screen/USD_to_BTC.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/screen/BTC_to_USD.dart';

void main() {
  runApp(BitcoinConverterApp());
}

class BitcoinConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BitcoinConverterScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class BitcoinConverterScreen extends StatefulWidget {
  @override
  _BitcoinConverterScreenState createState() => _BitcoinConverterScreenState();
}

class _BitcoinConverterScreenState extends State<BitcoinConverterScreen> {
  void selectConversion(BuildContext context, bool usdToBtc) {
    if (usdToBtc) {
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => BTCToUSDConversionScreen(),

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => USDToBTCConversionScreen()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BTCToUSDConversionScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitcoin Converter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Select Conversion Direction:",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectConversion(context, true),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button background color
                onPrimary: Colors.white, // Text color
                elevation: 5, // Button shadow
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Button padding
              ),
              child: Text("USD to BTC", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectConversion(context, false),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button background color
                onPrimary: Colors.white, // Text color
                elevation: 5, // Button shadow
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Button padding
              ),
              child: Text("BTC to USD", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
