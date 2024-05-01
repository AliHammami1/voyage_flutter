import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/gallerie-details.page.dart';

class GalleriePage extends StatelessWidget{
  TextEditingController txt_keyword = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Page Gallerie'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_keyword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.image),
                  hintText: "Keyword",
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
                  _onGetGallerieDetails(context, txt_keyword.text);
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

void _onGetGallerieDetails(BuildContext context, String keyword) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => GallerieDetailsPage(keyword)));
}

