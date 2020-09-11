

import 'package:flutter/material.dart';

class TransferListItem extends StatelessWidget {

  final String transferName;
  final double transferAmount;
  final DateTime transferDate;


  TransferListItem({this.transferName, this.transferAmount, this.transferDate});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Column(
            children: [
              Text('Aug 18'),
              Container(
                height: 40,
                width: 1,
                color: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          Icon(Icons.radio, color: Colors.red,),
          Column(
            children: [
                Text(transferName, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                Text('Date', style: TextStyle(color: Colors.grey, fontSize: 14),)
            ],
          ),
          RichText(
            text: TextSpan(
              text: '-\$14.',
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
