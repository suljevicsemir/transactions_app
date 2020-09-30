import 'package:flutter/material.dart';
import 'package:transactions_app/screens/home/home_widgets/drawer_widgets/drawer_item.dart';
import 'package:transactions_app/screens/home/home_widgets/drawer_widgets/list_divider.dart';

class AboutBankItems extends StatefulWidget {
  @override
  _AboutBankItemsState createState() => _AboutBankItemsState();
}

class _AboutBankItemsState extends State<AboutBankItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(title: 'Basic information', iconData: Icons.perm_device_info,),
        ListDivider(),
        DrawerItem(title: 'Contact', iconData: Icons.contact_page,),
        ListDivider(),
        DrawerItem(title: 'Social media', iconData: Icons.addchart_rounded,)
      ],
    );
  }
}
