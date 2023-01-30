import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslik = "Ortalama Hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);
  static final TextStyle listeBaslik = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w900, color: anaRenk);
  static final TextStyle listeBaslik2 = GoogleFonts.quicksand(
      fontSize: 13, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 17, fontWeight: FontWeight.w900, color: anaRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w900, color: anaRenk);

  static final dropDownnPadding = EdgeInsets.symmetric(horizontal: 18);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
