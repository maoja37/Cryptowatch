import 'package:cryptowatch/OtherScreens/all_coins_screens.dart';
import 'package:cryptowatch/constants.dart';
import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/repository/repository.dart';
import 'package:cryptowatch/widgets/coin_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<BigDataModel> futureCoins;
  late Repository repository;
  @override
  void initState() {
    // TODO: implement initState
    repository = Repository();
    futureCoins = repository.getCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double home_height = MediaQuery.of(context).size.height * 0.4905;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 84,
              left: 24,
              right: 24,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Watchlist',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text('View all',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: PrimaryBlue,
                            fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 218,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Coins',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllCoins(futureCoins)));
                      },
                      child: Text('View all',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: PrimaryBlue,
                              fontSize: 16)),
                    )
                  ],
                ),
                CoinListWidget(futureCoins: futureCoins, required_height: MediaQuery.of(context).size.height * 0.4905,)
              ],
            )),
      ),
    );
  }
}
