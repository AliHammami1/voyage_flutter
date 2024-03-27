import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.blueGrey])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/nnn.jpg"),
                radius: 80,
              ),
            )),
         ...(GlobalParams.menus as List).map((item) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  '${item['title']}',
                  style: TextStyle(fontSize: 22),
                ),
                leading: item['icon'],
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.blueGrey,
                ),
                onTap: () async {
                  if ('${item['title']}' != "Déconnexion") {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "${item['route']}");
                  } else {
                    prefs = await SharedPreferences.getInstance();
                    prefs.setBool("connecte", false);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  }
                },
              ),
              Divider(height: 4, color: Colors.blueGrey),
            ],
          );
        }),
      ],
    ));
  }
}
