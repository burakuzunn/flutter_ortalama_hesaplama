import 'package:dinamik_ortalama_hesaplama/data/helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import 'ders_listesi.dart';
import 'harf_dropdown.dart';
import 'kredi_drowDown.dart';
import 'ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4.0;
  double secilenKrediDeger = 1.0;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.baslik,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Form
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      ortalama: DataHelper.ortalamaHesaplama(),
                      dersSayisi: DataHelper.tumEklenenDersler.length),
                )
              ],
            ),
            Expanded(
              child: DersListesi(
                onDismiss: (index) {
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDownWidget(
                    onHarfSecildi: (value) {
                      secilenHarfDeger = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropWidget(
                    onKredi: (value) {
                      secilenKrediDeger = value;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _kaydet,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Sabitler.anaRenk,
                iconSize: 30,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          girilenDersAdi = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Ders Adını Giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders Adını Giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.4)),
    );
  }

  void _kaydet() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          dersAdi: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);

      DataHelper.dersekle(eklenecekDers);
      print(DataHelper.tumEklenenDersler);
      setState(() {});
    }
  }
}
