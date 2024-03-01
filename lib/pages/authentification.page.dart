import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController(); // hetha 3malt controle bech nejem ne5o value mte3 login
  TextEditingController txt_psw = new TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: 
        AppBar(
          title: 
            Text(
              'Authentification Page' ,
              style: TextStyle(color: Colors.white),
            ),
          backgroundColor: Colors.blueGrey,
        ),
      body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_login,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Identifiant",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1)
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_psw,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: "Mot de Passe",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blueGrey 
                  ),
                  onPressed: (){
                    _onlog(context);
                  }, 
                  child: 
                    Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                    )
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/inscription');
                },
                child: Text(
                  "Créer un compte",
                  style: TextStyle( 
                    fontSize: 18,
                    color: Color.fromARGB(255, 13, 143, 204),
                    decoration: TextDecoration.underline,
                  ),
                )
              )
            ],
          )
          
        )
      );
  }
  
    Future<void> _onlog(BuildContext context) async{
    prefs = await SharedPreferences.getInstance();
    var log = prefs.getString("login");
    var psw = prefs.getString("psw"); // zedneha async ... await bech n9olo requete tebta chwaya estaneha w raja3li type de future
    if(txt_login.text == log && txt_psw.text == psw){
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }
    else {
      const snackBar = SnackBar(
        content: Text('verifier les login et psw')
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}