

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/models/view_models/search_account_data.dart';
import 'package:transactions_app/screens/chats/search_delegate/account_search_tile.dart';

class SearchAccounts extends SearchDelegate {


  List<SearchAccountData> _accountData = List<SearchAccountData>();
  final _firestoreProvider = FirestoreProvider();
  int counter = 0;
  SearchAccounts():super(searchFieldLabel: 'Search account owners'){
    _load();
    print("counter init:");

  }

  _load() async {
    _accountData = await _firestoreProvider.getAllAccounts();
  }



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () { query = "";},
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('What dis do?');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    counter++;
    print(counter.toString());
    List<SearchAccountData> displayList = List<SearchAccountData>();

    if(query.length < 2) return Container();

    for(int i = 0; i < _accountData.length; i++) {
      if(_accountData.elementAt(i).id == FirebaseAuth.instance.currentUser.uid)
        continue;
      if(_accountData.elementAt(i).firstName.toUpperCase().startsWith(query.toUpperCase()) || _accountData.elementAt(i).lastName.toUpperCase().startsWith(query.toUpperCase())) {
        displayList.add(_accountData.elementAt(i));
        print('HIT ${_accountData.elementAt(i).firstName}');
        print('DISPLAY LIST LENGTH : ${displayList.length.toString()}');
      }
    }

    return Container(
      child: ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (context, index) => AccountSearchTile(accountData: displayList.elementAt(index))
      ),
    );
  }





}