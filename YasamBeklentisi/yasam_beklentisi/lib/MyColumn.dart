import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constans.dart';

class MyColumn extends StatelessWidget {
  final String? cinsiyet;
  final IconData? icon;
  MyColumn({this.cinsiyet, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.black54,
          size: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet!,
          style: MetinStili,
        )
      ],
    );
  }
}
