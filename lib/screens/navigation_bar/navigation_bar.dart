

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/add_transfer.dart';
import 'package:transactions_app/screens/expenses.dart';
import 'package:transactions_app/screens/home.dart';
import 'package:transactions_app/screens/personalization.dart';

class AppNavigationBar extends StatefulWidget {

  static const route = '/navigationBar';

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  int _navigationBarIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Expenses(),
    AddTransfer(),
    Personalization()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  _setNavigationBarIndex(index) {
    setState(() {
      _navigationBarIndex = index;
    });
  }

  _buildNavigationBar(int selectedIndex) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _setNavigationBarIndex(0);
            },
            child: _navigationBarItem('Home', _navigationBarIndex == 0),
          ),
          GestureDetector(
            onTap: () {
              _setNavigationBarIndex(1);
            },
          child: _navigationBarItem('Expenses', _navigationBarIndex == 1),
          ),
          GestureDetector(
            onTap: () {
              _setNavigationBarIndex(2);
            },
            child: _navigationBarItem('New transfer', _navigationBarIndex == 2)
          ),
          GestureDetector(
              onTap: () {
                _setNavigationBarIndex(3);
              },
              child: _navigationBarItem('About', _navigationBarIndex == 3)
          )
        ],
      ),
    );
  }


  _navigationBarItem(String title, bool selected) {
    return AnimatedDefaultTextStyle(
      style: selected == true ? NavigationBarStyles.selectedItemStyle : NavigationBarStyles.notSelectedItemStyle,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: selected == true ? EdgeInsets.fromLTRB(13, 10, 20, 10) : EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected == true ? Palette.themeGreen : Colors.transparent
        ),
        child: Row(
          children: [
            _buildIcon(title, selected),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }

  _buildIcon(String title, bool selected) {
    if( title != 'New transfer') {
      if( title == 'Home') {
        if(selected == true) {
          return Icon(Icons.home, color: Colors.black,);
        }
        return ImageIcon(
          AssetImage("images/outline_home.png"),
          color: Colors.black,
          size: 24,
        );
      }
      if( title == 'Expenses') {
        if(selected == true) {
          return Icon(Icons.account_balance_wallet, color: Colors.black,);
        }
        return ImageIcon(
          AssetImage("images/wallet_outline.png"),
          color: Colors.black,
          size: 24,
        );
      }

      if(selected == true) {
        return Icon(Icons.person);
      }
      return Icon(Icons.person_outline);
    }
    return Icon(Icons.add_to_queue, size: 28);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: _buildNavigationBar(_navigationBarIndex),
      body: PageStorage(
        child: _pages[_navigationBarIndex],
        bucket: bucket,
      ),
    );
  }
}


class NavigationBarStyles {
  static final selectedItemStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'MainFont',
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: 2.0
  );
  static final notSelectedItemStyle = TextStyle(
      fontSize: 0
  );
}
