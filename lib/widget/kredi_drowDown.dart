import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../data/helper.dart';

class KrediDropWidget extends StatefulWidget {
  final Function onKredi;
  const KrediDropWidget({required this.onKredi, super.key});

  @override
  State<KrediDropWidget> createState() => _KrediDropWidgetState();
}

class _KrediDropWidgetState extends State<KrediDropWidget> {
  double secilenKrediDeger = 1.0;

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
        value: secilenKrediDeger,
        onChanged: (value) {
          setState(() {
            secilenKrediDeger = value!;
            widget.onKredi(secilenKrediDeger);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
