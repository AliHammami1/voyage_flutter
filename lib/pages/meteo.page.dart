import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class MeteoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Méteo Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            'Méteo Page',
            style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
        )
    );
  }

}