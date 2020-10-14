
import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/chats/search_delegate/search_delegate.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext buildcontext;
  ChatsAppBar(this.buildcontext);
  final smtng = SearchAccounts();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.themeGreen,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: Container( margin: EdgeInsets.only(top: 15), child: Text('Demo Transaction App', style: TextStyle(color: Colors.black, fontSize: 22),)),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: IconButton(
            onPressed: () => showSearch(context: buildcontext, delegate: smtng),
            icon: Icon(Icons.search, color: Colors.black,),
            splashColor: Colors.white,
            splashRadius: 25,
          ),
        )
      ],

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}

