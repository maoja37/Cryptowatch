import 'package:cryptowatch/coingeckomodels/cg_list_coins.dart';
import 'package:cryptowatch/models/big_data_models.dart';
import 'package:cryptowatch/repository/repository.dart';
import 'package:flutter/material.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  late Future<CoinGeckoList> futureCoins;
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 85),
        child: Column(
          children: [
            FutureBuilder<CoinGeckoList>(
              future: futureCoins,
              builder: (context,snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final allCoins = snapshot.data!.cg_dataModel;
                   return 
                     ListTile( title: Text(allCoins[1].name, style: TextStyle(fontSize: 30,),),);

                    
                  } else if (snapshot.hasError) {
              return Center();
            }

                }
                return Center(
            child: CircularProgressIndicator(),
          );

            })
          ],
        ),
      ),
    );
  }
}
