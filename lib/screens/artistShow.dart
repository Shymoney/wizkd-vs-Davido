
import 'package:flutter/material.dart';
import 'package:wizkid_vs_davido/screens/home.dart';
import 'package:wizkid_vs_davido/data.dart';
import 'package:wizkid_vs_davido/arguments.dart';

class ShowArtist extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final ArtistShowArgument argument = ModalRoute.of(context).settings.arguments;
    if(argument.artist == "wizkid"){
        Map<String, String> data = Data().wizkidSlimProfile;
        List<Map<String, String>> songs = Data().wizkidSongs;
    }
    else if(argument.artist == "davido"){
      Map<String, String> data = Data().davidoSlimProfile;
      List<Map<String, String>> songs = Data().davidoSongs;
    }
    return Row(
      children: <Widget>[
        ArtistCardHeader(
        name: data["artist"].toString(),
        songCount: data["song-count"],
        image: data["image"].toString(),

    ),
        ListView.builder(itemBuilder: )
      ],
    );
  }
}


// ignore: must_be_immutable
class ArtistCardHeader extends StatelessWidget{
  String name,image;
  int songCount;
  ArtistCardHeader({this.name,this.songCount,this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ArtistHeader(
          name: this.name,
          color: Color(0xFFFBD7DB4),
          image:this.image,
          songCount: this.songCount
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ArtistSongs extends StatelessWidget{
List<Map<String, String>> data;
ArtistSongs({this.data});

  Widget song({String song})
  {
    return Container(
      child: Text(song,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0
        ),
      ),
      height: 200.0,
      color: Colors.lightBlueAccent,
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index){
        return song(song: data[index]["song"]);
      },
    );
  }

}