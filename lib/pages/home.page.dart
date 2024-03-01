import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      backgroundColor: Colors.blueGrey,),
      body: Center(
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: Colors.blueGrey 
            ),
            onPressed: (){
              _onDec(context);
            }, 
            child: Text(
              'Déconnexion',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white
              ),
            )
          )
      )
    );
  }
  
  Future<void> _onDec(BuildContext context) async{
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte",false);
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}