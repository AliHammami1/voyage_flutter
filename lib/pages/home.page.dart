import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import 'package:voyage/menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text('Utilisateur : ${FirebaseAuth.instance.currentUser?.email}'),
              SizedBox(height: 15,),
              Wrap(
                children: [
                  ...(GlobalParams.accueil as List).map((item){
                    return InkWell(
                      child: Ink.image(
                        height: 180,
                        width: 180,
                        image: AssetImage('${item['title']}'),
                      ),
                      onTap: () async{
                        if ('${item['title']}' != "images/deconnexion.png") {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "${item['route']}");
                        } else {
                          //prefs = await SharedPreferences.getInstance();
                          //prefs.setBool("connecte", false);
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/inscription', (route) => false);
                        }
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ));
  }


}


