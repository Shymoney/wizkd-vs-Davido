import 'package:flutter/material.dart';
import 'package:wizkid_vs_davido/data.dart';
import 'package:wizkid_vs_davido/routes.dart';
import 'package:wizkid_vs_davido/arguments.dart';


class Home extends StatelessWidget{

  List<Map<String, Object>> data = Data().data;

  @override
  Widget build(BuildContext context){

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index){
        return ArtistSelectionBox(data[index]);
      },
    );

  }
}


// ignore: must_be_immutable
class ArtistSelectionBox extends StatelessWidget{

Map<String, Object> data;
ArtistSelectionBox(this.data);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
            context,
            Router.artistShow,
            arguments: ArtistShowArgument(
              artist: this.data["name"]
            )
        );
      },
      child: Column(
        children: <Widget>[
          ArtistHeader(
            name: this.data["name"],
            image: this.data["image"],
            songCount: this.data["song-count"],
            color: this.data["color"],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left:10.0, right: 10.0),
            child: Text(this.data["description"],
              style:TextStyle(
                color: Colors.grey
              ),
            ),
          ),
        ],
      ),
    );
  }

}

// ignore: must_be_immutable
class ArtistHeader extends StatelessWidget{
  Map<String, Object> data;
  String name, image;
  int songCount;
  Color color;
  ArtistHeader({this.image,this.color,this.songCount,this.name});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom:10.0, top: 10.0),
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(0.0),
      child:
      Row(
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                margin:EdgeInsets.only(top: 5.0, left:10),
                child: Image.asset(this.image, fit: BoxFit.fill),
                color: this.color,
              )
          ),
          Expanded(
            child: Container(
              padding:  EdgeInsets.only(top: 20.0, bottom: 20.0),
              margin:EdgeInsets.only(top: 5.0, left:10),
              color: Colors.white,
              child: Column(
                  children: <Widget>[
                    Text(this.name,textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    Text(this.songCount.toString() + " songs",
                      textAlign: TextAlign.left,

                    )
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}