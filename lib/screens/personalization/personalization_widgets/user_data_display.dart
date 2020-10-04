import 'package:flutter/material.dart';
import 'package:transactions_app/screens/personalization/personalization_widgets/user_field_of_data.dart';

class UserDataDisplay extends StatelessWidget {

  final dynamic dataLeft;
  final dynamic dataRight;
  final String labelLeft, labelRight;
  final bool inline;

  UserDataDisplay({this.dataLeft, this.labelLeft, this.dataRight, this.labelRight, this.inline});

  @override
  Widget build(BuildContext context) {



    return inline != true ?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserFieldOfData(data: dataLeft, label: 'Balance'),
            UserFieldOfData(data: dataRight, label: 'Limit',)
          ],
        )
        :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataLeft.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(labelLeft, style: TextStyle(color: Colors.grey[600], fontSize: 16),)
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(dataRight.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(labelRight, style: TextStyle(color: Colors.grey[600], fontSize: 16),)
                  )
                ],
              ),
            ),
          ],
        );
  }
}
