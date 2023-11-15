import 'package:flutter_driver/driver_extension.dart';
import 'package:bitcoin_calculator/main.dart' as app;
import 'package:bitcoin_calculator/config/globals.dart' as globals;
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();
  
  final MockClient client = MockClient();
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
  var url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
  when(client.get(url))
          .thenAnswer((_) async => http.Response(fakeAPIData, 200));

  globals.httpClient = client;

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
