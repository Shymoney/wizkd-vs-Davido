
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
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
  List<Map<String, String>> songs;
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



    return ChangeNotifierProvider<GlobalPlayState>(
      builder: (context) => GlobalPlayState(),
      child: Column(
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
                    return ArtistSongParent(song: songs[index]["song"], index:index + 1, songPath:songs[index]["path"]);
                  }
              ),
            ),
          ],
        ),
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
  String songPath;

  ArtistSongParent({this.song, this.index, this.songPath});
  @override
   Widget build (BuildContext context){
    return ChangeNotifierProvider<LocalPlayState>(
       builder: (_)=>LocalPlayState(Icons.play_arrow),
      child: ArtistSong(song: this.song, index: this.index, songPath: this.songPath,)
     );
  }
}
// ignore: must_be_immutable
class ArtistSong extends StatelessWidget{
String song;
int index;
String songPath;


ArtistSong({this.song, this.index, this.songPath});
  IconData _play;
  Future<AudioPlayer> currentActiveSong ;
  AudioCache audioPlayerCache = AudioCache(
    fixedPlayer: new AudioPlayer()
  );


  @override
  Widget build(BuildContext context)
{
  var globalPlayState  = Provider.of<GlobalPlayState>(context);
  var localPlayState  = Provider.of<LocalPlayState>(context);
  _play = localPlayState.play;

  if(globalPlayState.except == this.index)
    {
      _play = localPlayState.play;
     this.currentActiveSong = audioPlayerCache.play(this.songPath);
    }
  else{
    _play = globalPlayState.play;
  }
  return ChangeNotifierProvider<LocalPlayState>(
    builder: (_) => Provider.of<LocalPlayState>(context),
    child: Consumer(
      builder: (BuildContext context, LocalPlayState playStateObject, _){
        return GestureDetector(
          onTap: (){
            localPlayState.changePlayState();
            globalPlayState.except = this.index;
          },
          child: Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            margin: EdgeInsets.only(bottom: 5.0),
            decoration: new BoxDecoration(
                color: Colors.white,
                border: new Border(
                  top:BorderSide(color: Colors.grey, width: 0.7),
//            bottom:BorderSide(color: Colors.grey, width: 0.7)
                )
            ),
            child:  Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child:IconButton(
                    icon: Icon(
                        this._play,
                        color:
                        Colors.black54,size: 30.0),
                    onPressed: () {
                      localPlayState.changePlayState();
                      globalPlayState.except = this.index;
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
          ),
        );
      },
    ),
  );
  }


}
