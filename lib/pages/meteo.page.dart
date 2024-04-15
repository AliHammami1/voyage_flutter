import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/meteo-details.page.dart';

class MeteoPage extends StatelessWidget{
  TextEditingController txt_ville = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Méteo Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_ville,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  hintText: "ville",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blueGrey),
                onPressed: () {
                  _onGetMeteoDetails(context, txt_ville.text);
                },
                child: Text(
                  'chercher',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

}

void _onGetMeteoDetails(BuildContext context, String ville) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MeteoDetailsPage(ville)));
}