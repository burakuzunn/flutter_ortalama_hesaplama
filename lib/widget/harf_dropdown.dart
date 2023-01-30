import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../data/helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({required this.onHarfSecildi, super.key});

  @override
  State<HarfDropDownWidget> createState() => __HarfDropDownWidgetState();
}

class __HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownnPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.4),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton(
        underline: Container(),
        value: secilenHarfDeger,
        onChanged: (value) {
          setState(() {
            secilenHarfDeger = value!;
            widget.onHarfSecildi(secilenHarfDeger);
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
    ;
  }
}
