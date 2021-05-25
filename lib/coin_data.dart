import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({this.cryptoCurrency, this.fiatCurrency});

  String price;
  String cryptoCurrency;
  String fiatCurrency;
  double n;
  Future getPrice() async {
    String url =
        'https://api.nomics.com/v1/currencies/ticker?key=8faa277d106a3f3f66d6f03ec2ba112c4e794a7b&ids=$cryptoCurrency&interval=1d,30d&convert=$fiatCurrency&per-page=100&page=1';
    http.Response response = await http.get(Uri.parse(url));
    String body = response.body;
    var decodedData = jsonDecode(body);
//    print(decodedData);
    price = decodedData[0]['price'];
    n = double.parse(price);
    price = n.toStringAsFixed(2);
    print(price);
//    print(n);
//    print(price.contains);
    return price;
  }
}
