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
          child: Wrap(
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
                      prefs = await SharedPreferences.getInstance();
                      prefs.setBool("connecte", false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    }
                  },
                );
              }),
            ],
          ),
        ));
  }


}


