import 'package:cryptowatch/coingeckomodels/cg_chart_data.dart';
import 'package:cryptowatch/coingeckomodels/cg_data_model.dart';
import 'package:cryptowatch/constants.dart';
import 'package:cryptowatch/models/data_model.dart';
import 'package:cryptowatch/provider/crypto_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class CoinDetailScreen extends StatelessWidget {
  final CoinGeckoDataModel coin;
  const CoinDetailScreen({ Key? key,required this.coin }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// class CoinDetailScreen extends StatefulWidget {
//   final CoinGeckoDataModel coin;
//   const CoinDetailScreen({Key? key, required this.coin}) : super(key: key);

//   @override
//   _CoinDetailScreenState createState() => _CoinDetailScreenState();
// }

// class _CoinDetailScreenState extends State<CoinDetailScreen> {
//   List<ChartData> oneDayRes = [];
//   List<ChartData> oneWeekRes = [];
//   List<ChartData> oneMonthRes = [];
//   List<ChartData> oneYearRes = [];

//   @override
//   Widget build(BuildContext context) {
//     getDayList(widget.coin.id);
//     final provider = Provider.of<CryptoProviders>(context);
//     final magic = provider.watchlistStrings;
//     final provider2 = Provider.of<CryptoProviders>(context, listen: false);
//     var coinIconUrl =
//         'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/';
//     return Scaffold(
//         body: SizedBox(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     splashRadius: 10,
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: Icon(CupertinoIcons.arrow_left),
//                   ),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             width: double.infinity,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: magic.contains(widget.coin.id)
//                                   ? Icon(IconlyBold.star)
//                                   : Icon(IconlyLight.star),
//                               color: magic.contains(widget.coin.id)
//                                   ? Color(0xffF7936F)
//                                   : Colors.grey,
//                               onPressed: () {
//                                 magic.contains(widget.coin.id)
//                                     ? provider2.removeCoin(widget.coin.id)
//                                     : provider2.addCoin(widget.coin.id);
//                               },
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             SvgPicture.asset(
//                                 'assets/images/box-arrow-up-right.svg'),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 0),
//                 leading: CachedNetworkImage(
//                     imageUrl: (coinIconUrl + widget.coin.symbol + '.png')
//                         .toLowerCase(),
//                     placeholder: (context, url) => CircularProgressIndicator(),
//                     errorWidget: (context, url, error) => SvgPicture.asset(
//                           'assets/images/Dollar_Sign.svg',
//                           color: Colors.blue,
//                         ),
//                     height: 40,
//                     width: 40),
//                 title: Text(
//                   '${widget.coin.name} (${widget.coin.symbol})',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 subtitle: Text(
//                   '\$' + widget.coin.current_price.toString(),
//                   style: TextStyle(
//                     color: Color(0xff929292),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 trailing: Text(
//                   widget.coin.price_change_percentage_7d_in_currency
//                           .toStringAsFixed(2) +
//                       '%',
//                   style: TextStyle(
//                       fontSize: 16,
//                       color:
//                           widget.coin.price_change_percentage_7d_in_currency >=
//                                   0
//                               ? Color(0xff4caf50)
//                               : Color(0xffe52f15),
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Text(
//                       '\$${widget.coin.current_price.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         color: Black6,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 14,
//                     ),
//                     Text(
//                       widget.coin.price_change_percentage_7d_in_currency
//                               .toStringAsFixed(2) +
//                           '%',
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: widget.coin
//                                       .price_change_percentage_7d_in_currency >=
//                                   0
//                               ? Color(0xff4caf50)
//                               : Color(0xffe52f15),
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 235,
              
//                 child: SfCartesianChart(
             
//                   primaryYAxis: NumericAxis(
//                     isVisible: false,
//                     rangePadding: ChartRangePadding.round,
//                   ),
//                   primaryXAxis: DateTimeAxis(isVisible: false),
//                   tooltipBehavior: TooltipBehavior(enable: false),
//                   series: <ChartSeries>[
//                     LineSeries<ChartData, DateTime>(
//                       dataSource: oneDayRes,
//                       xValueMapper: (ChartData coindata, _) => coindata.year,
//                       yValueMapper: (ChartData coindata, _)=> coindata.currentPrice,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }

//   void getDayList(String coinId) async {
//     final api = CoinGeckoApi();
//     final result = await api.coins.getCoinMarketChart(
//       id: coinId,
//       vsCurrency: 'usd',
//       days: 1,
//     );

//     result.data.forEach((element) {
//       oneDayRes.add(ChartData(element.date, element.price));
     
//     });
//     print(oneDayRes.last.currentPrice);
   
//   }

//   void getWeekList(String coinId) async {
//     final api = CoinGeckoApi();
//     final result = await api.coins.getCoinMarketChart(
//       id: coinId,
//       vsCurrency: 'usd',
//       days: 7,
//     );
//     result.data.forEach((element) {
//       oneWeekRes.add(ChartData(element.date, element.price));
//     });
//   }

//   void getMonthList(String coinId) async {
//     final api = CoinGeckoApi();
//     final result = await api.coins.getCoinMarketChart(
//       id: coinId,
//       vsCurrency: 'usd',
//       days: 30,
//     );
//     result.data.forEach((element) {
//       oneMonthRes.add(ChartData(element.date, element.price));
//     });
//   }

//   void getYearList(String coinId) async {
//     final api = CoinGeckoApi();
//     final result = await api.coins.getCoinMarketChart(
//       id: coinId,
//       vsCurrency: 'usd',
//       days: 30,
//     );
//     result.data.forEach((element) {
//       oneYearRes.add(ChartData(element.date, element.price));
//     });
//   }
// }
