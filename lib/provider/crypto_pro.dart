import 'package:flutter/cupertino.dart';

class CryptoProviders extends ChangeNotifier{

List<String> _watchlistStrings = ["BTC",];

List<String> get watchlistStrings => _watchlistStrings;


void addCoin(String coinSymbol) {
  _watchlistStrings.add(coinSymbol);
  print(_watchlistStrings);
  notifyListeners();
}

void removeCoin(String coinSymbol) {
  _watchlistStrings.remove(coinSymbol);
  print(_watchlistStrings);
  notifyListeners();
}




}