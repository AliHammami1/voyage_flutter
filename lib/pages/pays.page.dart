import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class PaysPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Pays Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            'Pays Page',
            style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
        )
    );
  }

}