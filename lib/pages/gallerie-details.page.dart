import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GallerieDetailsPage extends StatefulWidget {
  String keyword = "";

  GallerieDetailsPage(this.keyword);

  @override
  State<GallerieDetailsPage> createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  var gallerieData;
  int currentPage = 1;
  int size = 10;
  List<dynamic> hits = [];
  int totalPages=0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent)
      {
        if(currentPage<totalPages)
        {
          currentPage++;
          getGalleryData(widget.keyword);
        }
      }
    });
  }

  void getGalleryData(String keyword) {
    print("Méteo de la ville de " + keyword);
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${keyword}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.gallerieData = json.decode(resp.body);
        hits = gallerieData['hits'];
        hits.addAll(gallerieData['hits']);
        totalPages = (gallerieData['totalHits']/size).ceil();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: totalPages==0?Text('Pas de résultats'):
          Text("${widget.keyword}, Page ${currentPage}/${totalPages}"),
          backgroundColor: Colors.blueGrey,
        ),
        body: (gallerieData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (gallerieData == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: Center(
                            child: Text(
                              "${(hits[index]['tags'])} ",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          color: Colors.blue,
                        ),
                        
                      ),
                      Container(
                        child: Card(
                          child: Image.network("${hits[index]['webformatURL']}",
                          fit: BoxFit.fitWidth),
                          
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  );
                })));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
