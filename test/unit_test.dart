import 'dart:ffi';

import 'package:bitcoin_calculator/utils/converter_API_ADDED.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
    group('API testing', () {
        test('API works and returns string', () async {
          final client = MockClient();
          final fakeAPIData = 
          '''
          {
            "time": {
              "updated": "Nov 12, 2023 19:51:40 CST",
              "updatedISO": "Nov 12, 2023 19:51:40 CST",
              "updateduk": "Nov 12, 2023 19:51:40 GMT"
            },
            "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
                
            "bpi":{
              "USD": {
                "code": "USD",
                "rate": "14,934.5833",
                "description": "United States Dollar",
                "rate_float": 14934.5833
              }
            }
            
          }
          ''';
            // '{"categors": ["dev"], "created_at": "2020"}'
          var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
          
          when(client.get(url))
          .thenAnswer((_) async => http.Response(fakeAPIData, 200));

          //the extracted data from JSON
          Map<String, dynamic> response = await CoindeskAPI.fetchBitcoinPrice(client);
          double btcRate = response['bpi']['USD']['rate_float'];

          expect(btcRate, 14934.5833);

          // expect(response, 
          // {
          //   "time": {
          //     "updated": "Nov 12, 2023 19:51:40 CST",
          //     "updatedISO": "Nov 12, 2023 19:51:40 CST",
          //     "updateduk": "Nov 12, 2023 19:51:40 GMT"
          //   },
          //   "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using"
          //       "hourly conversion rate from openexchangerates.org",
          //   "bpi":{
          //     "USD": {
          //       "code": "USD",
          //       "rate": "14,934.5833",
          //       "description": "United States Dollar",
          //       "rate_float": 14934.5833
          //     }
          //   },
          //   "statusCode": 200
            
          // }
          // );

        });

        test('API does not work and returns error message string', () {
            final client = MockClient();
            var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
            when(client.get(url)).thenAnswer((_) async => http.Response('Failed to load Bitcoin price', 404));

            expect(CoindeskAPI.fetchBitcoinPrice(client), throwsException);
        });
    });
}

// void main() {
//   group('Value Testing', () {
//     test('usd to btc', () {
//       double result = Converter().usd_to_btc(5000.0);
//       expect(double.parse(result.toStringAsFixed(2)), 0.14);
//     });

//     test('btc to usd', () {
//       double result = Converter().btc_to_usd(1);
//       expect(double.parse(result.toStringAsFixed(2)), 34881.3);
//     });
//   });
// }

  