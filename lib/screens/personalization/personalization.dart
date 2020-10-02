

import 'package:flutter/material.dart';
import 'package:transactions_app/widget/sliver_app_bar.dart';


class Personalization extends StatefulWidget {

  static const route = '/account_info';

  @override
  _PersonalizationState createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: PersonalizationScreen()
    );
  }

  @override
  void initState() {
    super.initState();

  }
}
