

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/widget/sliver_app_bar.dart';


class Personalization extends StatefulWidget {

  @override
  _PersonalizationState createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonalizationAppBar()
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
    ));

  }
}
