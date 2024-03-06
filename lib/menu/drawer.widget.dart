import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        ListTile(
          title: Text('Accueil', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.home, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Météo', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.cloudy_snowing, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/meteo');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Gallerie', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.photo_size_select_actual_outlined, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/gallerie');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Pays', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.map_outlined, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/pays');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Contact', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.contact_page_outlined, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/contact');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Paramètres', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.settings, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () {
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, '/parametres');
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
        ListTile(
          title: Text('Déconnexion', style: TextStyle(fontSize: 22)),
          leading: Icon(Icons.logout, color: Colors.blueGrey),
          trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
          onTap: () async {
            prefs = await SharedPreferences.getInstance();
            prefs.setBool("connecte", false);
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          },
        ),
        Divider(height: 4, color: Colors.blueGrey),
      ],
    ));
  }
}