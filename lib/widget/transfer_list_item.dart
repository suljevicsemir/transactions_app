import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransferListItem extends StatelessWidget {

  final DocumentSnapshot _snapshot;


  TransferListItem(this._snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Text('Aug 18'),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  width: 1,
                  color: Colors.black.withOpacity(0.5),
                )
              ],
            ),
          ),
          Icon(Icons.radio, color: Colors.red,),
          Column(
            children: [
                Text(_snapshot.get('transferName'), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                Text('Date', style: TextStyle(color: Colors.grey, fontSize: 14),)
            ],
          ),
          RichText(
            text: TextSpan(
              text: '-\$${_snapshot.get('transferAmount')}.',
              style: TextStyle(color: Colors.red, fontSize: 18, fontFamily: 'Roboto' ),
              children: [
                TextSpan(
                  text: '99',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12, fontFamily: 'Roboto')
                )
              ]
            ),
          )
        ],
      ),

    );
  }
}
