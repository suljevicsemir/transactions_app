

import 'package:flutter/material.dart';
import 'package:transactions_app/screens/home/home_widgets/drawer_item.dart';
import 'package:transactions_app/screens/home/home_widgets/list_divider.dart';

class ToolsItems extends StatefulWidget {
  @override
  _ToolsItemsState createState() => _ToolsItemsState();
}

class _ToolsItemsState extends State<ToolsItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(title: 'Calculators', iconData: Icons.calculate_outlined,),
        ListDivider(),
        DrawerItem(title: 'Currency list', iconData: Icons.list,),
        ListDivider(),
        DrawerItem(title: 'Currency converting', iconData: Icons.switch_camera_sharp,)
      ],
    );
  }
}
