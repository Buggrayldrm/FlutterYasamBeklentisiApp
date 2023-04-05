import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constans.dart';
import 'package:yasam_beklentisi/input_page.dart';
import 'package:yasam_beklentisi/userData.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage(this.userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfasi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                "Beklenen Yaşam Süreniz\n                ${Hesap(userData: userData).hesaplama().round().toString()} Gün.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: MetinStili,
                ),
              )),
        ],
      ),
    );
  }
}
