import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconly/iconly.dart';

class CoinListWidget extends StatelessWidget {
  final Future<BigDataModel> futureCoins;
  const CoinListWidget({Key? key, required this.futureCoins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataModel> coins;
    var coinIconUrl =
        'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/';

    return FutureBuilder<BigDataModel>(
        future: futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              coins = snapshot.data!.dataModel;
              return Container(
                height: MediaQuery.of(context).size.height * 0.4905,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        height: 64,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    (coinIconUrl + coins[index].symbol + '.png')
                                        .toLowerCase(),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(
                                      'assets/images/Dollar_Sign.svg',
                                      color: Colors.blue,
                                    ),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  coins[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$' +
                                      coins[index]
                                          .quoteModel
                                          .usdModel
                                          .prices
                                          .toStringAsFixed(2),
                                  style: TextStyle(
                                    color: Color(0xff929292),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                  ),
                                ), 
                                Row(
                              children: [
                                Text(
                                  coins[index]
                                          .quoteModel
                                          .usdModel
                                          .percentageChange_7d
                                          .toStringAsFixed(2) +
                                      '%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: coins[index]
                                                  .quoteModel
                                                  .usdModel
                                                  .percentageChange_7d >=
                                              0
                                          ? Color(0xff4caf50)
                                          : Color(0xffe52f15),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  IconlyLight.star,
                                  size: 25,
                                )
                              ],
                            ),
                              ],
                            ))
                          ],
                        ),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Center();
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}


// ListTile(
//                           contentPadding: EdgeInsets.only(
//                             left: 0,
//                           ),
//                           leading: 
//                           title: 
//                           subtitle: 
//                           trailing: SizedBox(
//                             width: 100,
//                             child: 
//                           ),
//                         ),