

import 'package:flutter/material.dart';
import 'package:transactions_app/screens/home/home_widgets/drawer_item.dart';
import 'package:transactions_app/screens/home/home_widgets/list_divider.dart';

class AboutItems extends StatefulWidget {
  @override
  _AboutItemsState createState() => _AboutItemsState();
}

class _AboutItemsState extends State<AboutItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(title: 'Introductory information', iconData: Icons.info_outline,),
        ListDivider(),
        DrawerItem(title: 'Frequently asked questions', iconData: Icons.question_answer_outlined,)
      ],
    );
  }
}
