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

  /*
  * Wizkid Details
  * */
  static Map<String, Object> wizkidSlimProfile =
  {
    "artist":"Wizkid",
    "song-count":2,
    "total-global-plays":1221,
    "total-personal-plays":12,
    "image":"assets/wizkid.png"
  };

  static List<Map<String, String>> wizkidSongs =
  [
    {
      "song":"Back to the Matter ",
      "path":"assets/music/wizkid-matteer.mp3"
    },
    {
      "song":"Ojuelegba",
      "path":"assets/music/wizkid-ojuelegba.mp3"
    }
  ];

  /*
  * Davido SlimProfile
  * */
  static Map<String, Object> davidoSlimProfile =
  {
      "artist":"Wizkid",
      "song-count":2,
      "total-global-plays":1221,
      "total-personal-plays":12,
      "image":"assets/davido2.png"
  };

  static List<Map<String, String>> davidoSongs =
  [
    {
      "song":"Aye",
      "path":"assets/music/davido-aye.mp3"
    },
    {
      "song":"The Sound",
      "path":"assets/music/davido-the-sound.mp3"
    }
  ];

  static Map<String, Object> shuffleSlimProfile =
  {
    "artist":"Shuffle",
    "song-count":4,
    "image":"assets/shuffle.png"
  };

}