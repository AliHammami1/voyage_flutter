import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/pays.page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final routes = {
      '/inscription': (context) => InscriptionPage(),
      '/login': (context) => AuthentificationPage(),
      '/home': (context) => HomePage(),
      '/meteo': (context) =>MeteoPage(),
      '/gallerie': (context) => GalleriePage(),
      '/pays': (context) => PaysPage(),
      '/contact': (context) => ContactPage(),
      '/parametres': (context) =>ParametrePage()
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(), 
        builder: (context, snapshot) {
          if ( snapshot.connectionState == ConnectionState.done){
            bool conn = snapshot.data!.getBool('connecte')??false; // data! bech t9olo rani met2aked li data mahiyech null
            if(conn)
              return HomePage();
          }
          return InscriptionPage();
        },
        ),
    ); // MaterialApp
  }

}