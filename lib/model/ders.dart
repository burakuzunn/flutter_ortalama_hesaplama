class Ders {
  final String dersAdi;
  final double harfDegeri;
  final double krediDegeri;

  Ders(
      {required this.dersAdi,
      required this.harfDegeri,
      required this.krediDegeri});

  @override
  String toString() {
    return "ad:$dersAdi harfDegeri:$harfDegeri krediDegeri:$krediDegeri";
  }
}
