import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String Price = 'loading..';

  void getPrice() async {
    CoinData coinData = CoinData(
        cryptoCurrency: newCryptoValue, fiatCurrency: newCurrencyValue);
    var p = await coinData.getPrice();
    setState(() {
      Price = p.toString();
    });

//    print(Price);
  }

  String newCurrencyValue = 'INR';

  List<DropdownMenuItem<String>> getDropdownlist() {
    List<DropdownMenuItem<String>> dropDownList = [];
    Widget dropDownItem;

    for (String currencyValue in currenciesList) {
      dropDownItem = DropdownMenuItem(
        child: Text(currencyValue,
          style: TextStyle(fontSize: 30.0),),
        value: currencyValue,
      );
      dropDownList.add(dropDownItem);
    }
    return dropDownList;
  }

  String newCryptoValue = 'BTC';
  List<DropdownMenuItem<String>> getCryptoList() {
    List<DropdownMenuItem<String>> newCryptoList = [];
    Widget dropDownItem;
    for (String cryptoValue in cryptoList) {
      dropDownItem = DropdownMenuItem(
        child: Text(cryptoValue,
        style: TextStyle(fontSize: 30.0),
        ),
        value: cryptoValue,
      );
      newCryptoList.add(dropDownItem);
    }
    return newCryptoList;
  }

  @override
  Widget build(BuildContext context) {
    getPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: DropdownButton(
                      value: newCryptoValue,
                      items: getCryptoList(),
//                      [
//                        DropdownMenuItem(
//                          child: Text('1 BTC'),
//                          value: 'BTC',
//                        ),
//                        DropdownMenuItem(
//                          child: Text('1 DOGE'),
//                          value: 'DOGE',
//                        ),
//                        DropdownMenuItem(
//                          child: Text('1 ETH'),
//                          value: 'ETH',
//                        ),
//                      ],
                      onChanged: (value) {
                        setState(() {
                          newCryptoValue = value;
                        });
                      },
                    ),
                  ),
                  Text('=',style: TextStyle(fontSize: 30.0),),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: DropdownButton(
                      value: newCurrencyValue,
                      items: getDropdownlist(),
                      onChanged: (value) {
                        setState(() {
                          newCurrencyValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              color: Colors.lightBlueAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            alignment: Alignment.center,
//            padding: EdgeInsets.only(bottom: 30.0),
            margin: EdgeInsets.all(18.0),

            child: Center(
              child: Text(
                Price,
                style: TextStyle(fontSize: 60.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Text(
//'1 $dropDownValue',
//textAlign: TextAlign.center,
//style: TextStyle(
//fontSize: 20.0,
//color: Colors.white,
//),
//),
//[
//DropdownMenuItem(
//child: Text('BTC'),
//value: 'btc',
//),
//DropdownMenuItem(
//child: Text('DOGE'),
//value: 'doge',
//),
//DropdownMenuItem(
//child: Text('ETH'),
//value: 'eth',
//),

//Text(
//Price,
//style: TextStyle(fontSize: 20.0),
//),
