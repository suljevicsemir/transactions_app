
import 'package:flutter/material.dart';

class ChatsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        backgroundColor: Colors.red,
      ),
    );
  }
}
