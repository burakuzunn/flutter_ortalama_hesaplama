import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../data/helper.dart';
import '../model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      tumDersler[index].dersAdi,
                      style: Sabitler.listeBaslik,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Sabitler.anaRenk,
                      child: Text((tumDersler[index].harfDegeri *
                              tumDersler[index].krediDegeri)
                          .toStringAsFixed(0)),
                    ),
                    subtitle: Container(
                      padding: Sabitler.yatayPadding8,
                      decoration: BoxDecoration(
                          borderRadius: Sabitler.borderRadius,
                          color: Sabitler.anaRenk.shade100),
                      child: Text(
                        "Kredi Değeri:${(tumDersler[index].krediDegeri).toInt()} Not Değeri${tumDersler[index].harfDegeri}",
                        style: Sabitler.listeBaslik2,
                      ),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
            child: Text(
              "Lütfen Ders Ekleyin...",
              style: Sabitler.baslikStyle,
            ),
          ));
  }
}
