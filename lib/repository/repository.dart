import 'package:cryptowatch/coingeckomodels/cg_list_coins.dart';
import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/models/data_model.dart';
import 'package:dio/dio.dart';
class Repository{
  
 static String mainUrl = 'https://pro-api.coinmarketcap.com/v1/';
 static String apiKey = '65b3ad7d-8909-4809-afe7-d78c263b039f';
 var currencyListingAPI  = '${mainUrl}cryptocurrency/listings/latest';

 Dio _dio = Dio();
 
 //Method used to get a future of list of data of coins 
 Future<CoinGeckoList> getCoins() async{
   try {
    //  _dio.options.headers['X-CMC_PRO_API_KEY'] = apiKey;
    //  Response response = await _dio.get(currencyListingAPI);
     Response response = await _dio.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d%2C14d');
    
     return CoinGeckoList.fromJson(response.data);
     //BigDataModel.fromJson(response.data);
   } catch (error, stackTrace) {
     print('Exception $error , dd $stackTrace');
     return CoinGeckoList.withError('');
   }
 }
}
   

