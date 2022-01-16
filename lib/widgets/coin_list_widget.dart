import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/models/data_model.dart';
import 'package:cryptowatch/provider/crypto_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class CoinListWidget extends StatelessWidget {
  final Future<BigDataModel> futureCoins;
  final double required_height;
  final List<String> required_list;
  const CoinListWidget(
      {Key? key, required this.futureCoins, required this.required_height, required this.required_list  })
      : super(key: key);
      

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProviders>(context);
    final magic = provider.watchlistStrings;
    final provider2 = Provider.of<CryptoProviders>(context, listen: false);

    List<DataModel> coins;
    var coinIconUrl = 
        'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/';

    return FutureBuilder<BigDataModel>(
        future: futureCoins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              coins = snapshot.data!.dataModel;
              provider2.addAllCoinSymbol(coins);
              return Container(
                height: 500,
                child: ListView.separated(
                  cacheExtent: 20000,
                  shrinkWrap: true,
                  physics: required_list.length < 9 ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: coins.length,
                    itemBuilder: (context, index)  {
                      if (required_list.contains(coins[index].symbol))
                      return  Container(
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
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    coins[index].name,
                                    
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                    IconButton(
                                      icon: magic.contains(coins[index].symbol)
                                          ? Icon(IconlyBold.star)
                                          : Icon(IconlyLight.star),
                                      color: magic.contains(coins[index].symbol)
                                          ? Color(0xffF7936F)
                                          : Colors.grey,
                                      onPressed: () {
                                        magic.contains(coins[index].symbol)
                                            ? provider2
                                                .removeCoin(coins[index].symbol)
                                            : provider2
                                                .addCoin(coins[index].symbol);
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                      ); else return SizedBox(height: 0,);
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