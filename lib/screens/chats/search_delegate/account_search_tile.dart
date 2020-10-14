

import 'package:flutter/material.dart';
import 'package:transactions_app/models/view_models/search_account_data.dart';

class AccountSearchTile extends StatelessWidget {

  final SearchAccountData accountData;


  AccountSearchTile({this.accountData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('henlo');
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: accountData.firstName, style: TextStyle(color: Colors.black)),
                    TextSpan(text: accountData.lastName, style: TextStyle(color: Colors.black, fontSize: 22))
                  ]
                ),
              )
            ),

          ],
        ),
      ),
    );
  }
}
