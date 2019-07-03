import 'package:flutter/material.dart';
import 'package:wizkid_vs_davido/screens/home.dart';
import 'package:wizkid_vs_davido/screens/artistShow.dart';
import 'package:wizkid_vs_davido/screens/songShow.dart';

class Router{

  final BuildContext context;
  static final String index = "/";
  static final String artistShow = "/artist";
  static final String songShow = "/artist/song";
  
  Router(this.context);
  
  Map<String, Object> routes(){
    
    return{

      Router.index: (context) => Home(),

      Router.artistShow: (context)=>ShowArtist(),

      Router.songShow: (context)=> SongShow(),

    };
  }

}