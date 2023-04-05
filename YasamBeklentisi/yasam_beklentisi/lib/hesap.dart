import 'package:yasam_beklentisi/userData.dart';

class Hesap {
  final UserData userData;
  Hesap({  required this.userData});
  double hesaplama() {
    double? sonuc;
    sonuc = 90 + userData.sporSayisi! - userData.icilenSigara!;
    sonuc = sonuc + (userData.boy! / userData.kilo!);

    if (userData.seciliCinsiyet == "Kadın") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
