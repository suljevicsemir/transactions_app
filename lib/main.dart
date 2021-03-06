import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/chat/chat.dart';
import 'package:transactions_app/screens/customer_support/screen.dart';
import 'package:transactions_app/screens/home/home.dart';
import 'package:transactions_app/screens/login_screens/account_create_form.dart';
import 'package:transactions_app/screens/login_screens/pin_configuration.dart';
import 'package:transactions_app/screens/navigation_bar/navigation_bar.dart';
import 'package:transactions_app/screens/personalization/personalization.dart';
import 'package:transactions_app/screens/pin_screen.dart';
import 'package:transactions_app/screens/wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Palette.themeGreen
  ));
  await Firebase.initializeApp();
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Wrapper.route,
      routes: {
        Wrapper.route : (context) => Wrapper(),
        PINState.route : (context) => PINState(),
        PINConfiguration.route: (context) => PINConfiguration(),
        Home.route : (context) => Home(),
        AccountCreate.route : (context) => AccountCreate(),
        AppNavigationBar.route : (context) => AppNavigationBar(),
        CustomerSupportScreen.route : (context) => CustomerSupportScreen(),
        Personalization.route : (context) => Personalization(),
        ChatScreen.route : (context) => ChatScreen(chatInfo: ModalRoute.of(context).settings.arguments)
      },
    );
  }
}


