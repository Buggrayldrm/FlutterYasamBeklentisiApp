import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/constans.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/userData.dart';
import 'MyContainer.dart';
import 'MyColumn.dart';
import 'constans.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0;
  double sporSayisi = 0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child: buildDrowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildDrowOutlineButton("KILO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Haftanın Kaç Günü Spor Yapıyorsun?", style: MetinStili),
                  Text(
                    sporSayisi.round().toString(),
                    style: SayiStili,
                  ),
                  Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporSayisi,
                      onChanged: ((double newValue) {
                        setState(() {
                          sporSayisi = newValue;
                        });
                      }))
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: MetinStili,
                  ),
                  Text(
                    "${icilenSigara.round()}",
                    style: SayiStili,
                  ),
                  Slider(
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: ((double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      }))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: (() {
                      setState(() {
                        seciliCinsiyet = "Kadın";
                      });
                    }),
                    renk:
                        seciliCinsiyet == "Kadın" ? Colors.grey : Colors.white,
                    child: MyColumn(
                      cinsiyet: "KADIN",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: (() {
                      setState(() {
                        seciliCinsiyet = "Erkek";
                      });
                    }),
                    renk:
                        seciliCinsiyet == "Erkek" ? Colors.grey : Colors.white,
                    child: MyColumn(
                        cinsiyet: "ERKEK", icon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(50, 50)),
              foregroundColor: MaterialStateProperty.all(Colors.blue),
              overlayColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          kilo: kilo,
                          boy: boy,
                          seciliCinsiyet: seciliCinsiyet,
                          sporSayisi: sporSayisi,
                          icilenSigara: icilenSigara),
                    ),
                  ));
            },
            child: const Text(
              "Hesapla",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Row buildDrowOutlineButton(String textt) {
    return Row(
      children: [
        Expanded(
          child: MyContainer(
            child: Row(
              children: <Widget>[
                RotatedBox(
                    quarterTurns: -1, child: Text("$textt", style: MetinStili)),
                const SizedBox(
                  width: 20,
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    textt == "BOY" ? boy.toString() : kilo.toString(),
                    style: SayiStili,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 36,
                      child: OutlinedButton(
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 20,
                          color: Colors.black54,
                        ),
                        onPressed: (() {
                          setState(() {
                            textt == "BOY" ? boy++ : kilo++;
                          });
                        }),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 36,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            textt == "BOY" ? boy-- : kilo--;
                          });
                        },
                        child: const Icon(
                          FontAwesomeIcons.minus,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
