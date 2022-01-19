import 'package:cryptowatch/models/data_model.dart';
import 'package:cryptowatch/provider/crypto_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CoinDetailScreen extends StatefulWidget {
  final DataModel coin;
  const CoinDetailScreen({Key? key, required this.coin}) : super(key: key);

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProviders>(context);
    final magic = provider.watchlistStrings;
    final provider2 = Provider.of<CryptoProviders>(context, listen: false);
    var coinIconUrl =
        'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/';
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 85, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.arrow_left),
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
                            IconButton(
                              icon: magic.contains(widget.coin.symbol)
                                  ? Icon(IconlyBold.star)
                                  : Icon(IconlyLight.star),
                              color: magic.contains(widget.coin.symbol)
                                  ? Color(0xffF7936F)
                                  : Colors.grey,
                              onPressed: () {
                                magic.contains(widget.coin.symbol)
                                    ? provider2.removeCoin(widget.coin.symbol)
                                    : provider2.addCoin(widget.coin.symbol);
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SvgPicture.asset(
                                'assets/images/box-arrow-up-right.svg'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0),
                leading: CachedNetworkImage(
                    imageUrl: (coinIconUrl + widget.coin.symbol + '.png')
                        .toLowerCase(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                          'assets/images/Dollar_Sign.svg',
                          color: Colors.blue,
                        ),
                    height: 40,
                    width: 40),
                title: Text(
                  '${widget.coin.name} (${widget.coin.symbol})',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '\$' +
                      widget.coin.quoteModel.usdModel.prices.toStringAsFixed(2),
                  style: TextStyle(
                    color: Color(0xff929292),
                    fontWeight: FontWeight.w400,
                  ),
                ),





                trailing: Text(
                                      widget.coin
                                              .quoteModel
                                              .usdModel
                                              .percentageChange_7d
                                              .toStringAsFixed(2) +
                                          '%',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: widget.coin
                                                      .quoteModel
                                                      .usdModel
                                                      .percentageChange_7d >=
                                                  0
                                              ? Color(0xff4caf50)
                                              : Color(0xffe52f15),
                                          fontWeight: FontWeight.w400),
                                    ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
