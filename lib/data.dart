import 'package:flutter/material.dart';

class Data{

  List<Map<String, Object>> data = [
    {
      "name": "wizkid",
      "image":"assets/wizkid.png",
      "color":Color(0xFFFBD7DB4),
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
          " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley",
      "song-count":21
    },
    {
      "name": "Davido",
      "image":"assets/davido2.png",
      "color":Color(0xFFFFCC776),
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
          " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley",
      "song-count":213
    },
    {
      "name": "Shuffle",
      "image":"assets/shuffle.png",
      "color":Color(0xFFF54C4C6),
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
          " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley",
      "song-count":211
    }
  ];

  List<Map<String, Object>> wizkidSlimProfile =[{
    "artist":"Wizkid",
    "song-count":21,
    "total-global-plays":1221,
    "total-personal-plays":12,
    "image":"assets/wizkid.png"
  }];

  List<Map<String, Object>> wizkidSongs = [
    {
      "artist":"Wizkid",
      "song":"Jaiye Jaiye",
      "total-play":212,
    },
    {
      "artist":"Wizkid",
      "song":"Ayo",
      "total-play":212,
    },
    {
      "artist":"Ojuelegba",
      "total-play":212,
    },
    {
      "artist":"Wizkid",
      "song":"Matter",
      "total-play":212,
    }
  ];

  List<Map<String, Object>> davidoSlimProfile =[{
    "artist":"Wizkid",
    "song-count":21,
    "total-global-plays":1221,
    "total-personal-plays":12,
    "image":"assets/wizkid.png"
  }];

  List<Map<String, Object>> davidoSongs = [
    {
      "artist":"Wizkid",
      "song":"Jaiye Jaiye",
      "total-play":212,
    },
    {
      "artist":"Wizkid",
      "song":"Ayo",
      "total-play":212,
    },
    {
      "artist":"Ojuelegba",
      "total-play":212,
    },
    {
      "artist":"Wizkid",
      "song":"Matter",
      "total-play":212,
    }
  ];
}