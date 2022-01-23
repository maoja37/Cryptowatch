import 'package:cryptowatch/coingeckomodels/cg_data_model.dart';
import 'package:cryptowatch/coingeckomodels/cg_list_coins.dart';
import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/models/data_model.dart';
import 'package:flutter/cupertino.dart';

class CryptoProviders extends ChangeNotifier {
  //variable used to store coin data in form of Future
  late Future<CoinGeckoList> futureCoins;
  //this stores all the string symbol that will be used to display coins
  List<String> _allStrings = [];
  //this stores the string symbols that will be used to identify coins added to the watchlist
  List<String> _watchlistStrings = [
    "BTC",
  ];

//getter methods to get list of of allStringSymbol and watchlistStringSymbol
  List<String> get allStrings => _allStrings;
  List<String> get watchlistStrings => _watchlistStrings;

//method to collect coin symbol and add it to list of watchlist
  void addCoin(String coinSymbol) {
    _watchlistStrings.add(coinSymbol);

    notifyListeners();
  }
//method to remove coin symbol from the list of watchlist
  void removeCoin(String coinSymbol) {
    _watchlistStrings.remove(coinSymbol);

    notifyListeners();
  }
//method to collect all list of coin data and store the individual symbols in list of allStringSymbols
  void addAllCoinSymbol(List<CoinGeckoDataModel> coins) {
    for (var index = 0; index < coins.length; index++) {
      if (!_allStrings.contains(coins[index].symbol))
        _allStrings.add(coins[index].symbol);
    }
    print(_allStrings);
    print(_allStrings.length);
  }

//getter method to get futureCoins
  Future<CoinGeckoList> get getFutureCoins => futureCoins;
//setter method to set future coins
  void set setFutureCoins(Future<CoinGeckoList> importedFuture) {
    futureCoins = importedFuture;

  }
}
