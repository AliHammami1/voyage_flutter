import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import 'package:voyage/firebase_options.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
 //void main() => runApp(MyApp());

ThemeData theme = ThemeData.light();
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();
 Future<void> main() async{ 
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    //theme = (await _onGetMode() == "Jour")? ThemeData.light() : ThemeData.dark();
    GlobalParams.themeActuel.setMode(await _onGetMode());
    runApp(MyApp());
 }

Future<String> _onGetMode() async {
    final snapshot = await ref.child('mode').get();
    if (snapshot.exists)
      mode = snapshot.value.toString();
    else
      mode = "Jour";
    print(mode);
    return (mode);
  }
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      theme: GlobalParams.themeActuel.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home:  StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(), 
                builder: (context,snapshot){ 
                if(snapshot.hasData)
                return HomePage();
                else
                return InscriptionPage();
                }
      ),
      
    ); 
  }
  @override
  void initState(){
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
}

