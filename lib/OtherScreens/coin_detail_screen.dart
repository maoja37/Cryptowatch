import 'package:cryptowatch/models/data_model.dart';
import 'package:cryptowatch/provider/crypto_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                            width: 32,
                          ),
                          SvgPicture.asset(
                              'assets/images/box-arrow-up-right.svg'),
                        ],
                      )
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
