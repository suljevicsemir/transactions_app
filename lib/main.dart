import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/screens/pin_screen.dart';
import 'package:transactions_app/screens/wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PINState.route,
      routes: {
        Wrapper.route : (context) => Wrapper(),
        PINState.route : (context) => PINState(),
      },
    );
  }
}


