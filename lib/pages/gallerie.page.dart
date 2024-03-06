import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class GalleriePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Gallerie Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Text(
            'Gallerie Page',
            style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                ),
        )
    );
  }

}