import 'package:cryptowatch/constants.dart';
import 'package:flutter/material.dart';

class CoinVolumeCard extends StatelessWidget {
  final String position;
  final num pos_24h;
  const CoinVolumeCard(
      {Key? key, required this.position, required this.pos_24h})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: TextStyle(color: Black6, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
