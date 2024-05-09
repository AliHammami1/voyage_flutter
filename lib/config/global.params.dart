import 'package:flutter/material.dart';
import '../notifier/theme.dart';

class GlobalParams {
  static List<Map<String,dynamic>> menus = [
    {"title":"Accueil","icon":Icon(Icons.home, color: Colors.blueGrey),"route":"/home"},
    {"title":"Météo","icon":Icon(Icons.cloudy_snowing, color: Colors.blueGrey),"route":"/meteo"},
    {"title":"Gallerie","icon":Icon(Icons.photo_size_select_actual_outlined, color: Colors.blueGrey),"route":"/gallerie"},
    {"title":"Pays","icon":Icon(Icons.map_outlined, color: Colors.blueGrey),"route":"/pays"},
    {"title":"Contact","icon":Icon(Icons.contact_page_outlined, color: Colors.blueGrey),"route":"/contact"},
    {"title":"Parametres","icon":Icon(Icons.settings, color: Colors.blueGrey),"route":"/parametres"},
    {"title":"Déconnexion","icon":Icon(Icons.logout, color: Colors.blueGrey),"route":"/login"},
  ];

  static List<Map<String,dynamic>> accueil = [
    {"title":"images/meteo.png","icon":Icon(Icons.cloudy_snowing, color: Colors.blueGrey),"route":"/meteo"},
    {"title":"images/gallerie.png","icon":Icon(Icons.photo_size_select_actual_outlined, color: Colors.blueGrey),"route":"/gallerie"},
    {"title":"images/pays.png","icon":Icon(Icons.map_outlined, color: Colors.blueGrey),"route":"/pays"},
    {"title":"images/contact.png","icon":Icon(Icons.contact_page_outlined, color: Colors.blueGrey),"route":"/contact"},
    {"title":"images/parametres.png","icon":Icon(Icons.settings, color: Colors.blueGrey),"route":"/parametres"},
    {"title":"images/deconnexion.png","icon":Icon(Icons.logout, color: Colors.blueGrey),"route":"/login"},
  ];

  static MonTheme themeActuel=MonTheme();
}