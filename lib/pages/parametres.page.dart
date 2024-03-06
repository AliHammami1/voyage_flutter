import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class ParametrePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Paramètres Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            'Paramètres Page',
            style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
        )
    );
  }

}