
import 'package:flutter/material.dart';
import 'package:wizkid_vs_davido/screens/home.dart';
import 'package:wizkid_vs_davido/data.dart';
import 'package:wizkid_vs_davido/arguments.dart';
import 'package:wizkid_vs_davido/state_management/playState.dart';
import 'package:provider/provider.dart';

class ShowArtist extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ShowArtistCollection(),
      appBar: AppBar(
        title: Text('Wizkid vs Davido'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.multiline_chart),
            onPressed: () {
              // Implement navigation to shopping cart page here...
              print('Wizkid VS Davido');
            },
          ),
        ],


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow, color: Colors.white),
        onPressed: () {},
      )
    );

  }
}

// ignore: must_be_immutable
class ShowArtistCollection extends StatelessWidget{
  Map<String, Object> data;
  List<String> songs;
  String outcome ;
  List<Widget> songList;
  @override
  Widget build(BuildContext context) {

    final ArtistShowArgument argument = ModalRoute.of(context).settings.arguments;
    final String artist = argument.artist.toLowerCase();
    if(artist == "wizkid"){
      data = Data.wizkidSlimProfile;
      songs = Data.wizkidSongs;
      outcome = "wizkid";
    }
    else if(artist == "davido"){
       data = Data.davidoSlimProfile;
       songs = Data.davidoSongs;
       outcome = "davido";

    }else if(artist == "shuffle"){
      data = Data.shuffleSlimProfile;
      songs = Data.wizkidSongs;
      songs.addAll(Data.davidoSongs);
      songs.shuffle();
      outcome = "shuffle";

    }



    return Column(
        children: <Widget>[

          Container(
            child: ArtistCardHeader(
            name: outcome,
            songCount: data["song-count"] as int,
            image: data["image"].toString(),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index){
                  return ArtistSongParent(song: songs[index], index:index + 1);
                }
            ),
          ),
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
    return Column(
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
class ArtistSongParent extends StatelessWidget{
  String song;
  int index;

  ArtistSongParent({this.song, this.index});
  @override
   Widget build (BuildContext context){
     return ChangeNotifierProvider<PlayState>(
       builder: (_)=>PlayState(Icons.play_arrow),
      child: ArtistSong(song: this.song, index: this.index)
     );
  }
}
// ignore: must_be_immutable
class ArtistSong extends StatelessWidget{
String song;
int index;
IconData playState = Icons.play_arrow;


ArtistSong({this.song, this.index});
  @override
  Widget build(BuildContext context)
{
//  final playStateObject = ;
  return ChangeNotifierProvider<PlayState>(
    builder: (_) => Provider.of<PlayState>(context),
    child: Consumer(
      builder: (BuildContext context, PlayState playStateObject, _){
        return Container(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                top:BorderSide(color: Colors.grey, width: 0.7),
//            bottom:BorderSide(color: Colors.grey, width: 0.7)
              )
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child:IconButton(
                  icon: Icon(
                      playStateObject.getPlay(),
                      color:
                      Colors.black54,size: 30.0),
                  onPressed: () {
                    playStateObject.changePlayState();
                  },
                ),
              ),
              Container(
                child: Text(this.index.toString() +". "+ this.song,
                  textAlign: TextAlign.start,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                  ),
                ),
              ),
            ],
          ),
          height: 60.0,
        );
      },
    ),
  );
  }


}
