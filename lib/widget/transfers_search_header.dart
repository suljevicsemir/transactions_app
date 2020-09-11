

import 'package:flutter/material.dart';

class TransferSearchHeader extends StatefulWidget {

  final String text;
  final bool selected;


  TransferSearchHeader({this.text, this.selected});

  @override
  _TransferSearchHeaderState createState() => _TransferSearchHeaderState();
}

class _TransferSearchHeaderState extends State<TransferSearchHeader> {

  int _index = 0;

  _setIndex(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 60,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _setIndex(0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: TransferSearchItem(text: 'Week', selected: _index == 0,)),
            ),
            GestureDetector(
              onTap: () => _setIndex(1),
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: TransferSearchItem(text: 'Month', selected: _index == 1,)),
            ),
            GestureDetector(
              onTap: () => _setIndex(2),
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: TransferSearchItem(text: 'Year', selected: _index == 2,)),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                splashColor: Colors.red,
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black,),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TransferSearchItem extends StatefulWidget {

  final String text;
  final bool selected;


  TransferSearchItem({this.text, this.selected});

  @override
  _TransferSearchItemState createState() => _TransferSearchItemState();
}

class _TransferSearchItemState extends State<TransferSearchItem> {
  final selectedTextStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: Colors.black
  );

  final notSelectedTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.black.withOpacity(0.3),
      fontFamily: 'Roboto'
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: widget.selected == true ? selectedTextStyle : notSelectedTextStyle,
      duration: const Duration(milliseconds: 100),
      child: Column(
        children: [
          Text(widget.text),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black
            ),
            child: Icon(
              Icons.radio_button_checked,
              color: Colors.black,
              size: widget.selected == true ? 7.0 : 0.0,
            ),
          )
        ],
      ),
    );
  }
}



















