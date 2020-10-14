import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/models/view_models/search_account_data.dart';
import 'package:transactions_app/screens/chat/chat.dart';

class AccountSearchTile extends StatelessWidget {

  final SearchAccountData accountData;
  final _firestoreProvider = FirestoreProvider();

  AccountSearchTile({this.accountData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       ChatInfo chatInfo = await _firestoreProvider.chatHandler(accountData.id);
        Navigator.pushReplacementNamed(context, '/chat', arguments: chatInfo);
      },
      child: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                   child : Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: accountData.firstName, style: TextStyle(color: Colors.black, fontSize: 22)),
                          TextSpan(text: '    '),
                          TextSpan(text: accountData.lastName.toUpperCase(), style: TextStyle(color: Colors.black, fontSize: 26))
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(accountData.email, style: TextStyle(color: Colors.black, fontSize: 22),))

          ],
        ),
      ),
    );
  }
}
