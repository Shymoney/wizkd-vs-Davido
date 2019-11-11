import 'package:flutter/material.dart';


class GlobalPlayState with ChangeNotifier{

  IconData _playState;
  int _changeAllExcept;

  GlobalPlayState(){
    this.play = Icons.play_arrow;
  }

  get except => _changeAllExcept;

  get play => _playState;

  set play(IconData play)
  {
    _playState = play;
    notifyListeners();
  }

  set except(int except)
  {
    _changeAllExcept = except;
    notifyListeners();
  }

  void changePlayState()
  {
    if(this._playState == Icons.play_arrow)
    {
      this.play = Icons.pause;
    }
    else{
      this.play = Icons.play_arrow;
    }

  }


}

class LocalPlayState with ChangeNotifier{
  IconData _playState;

  LocalPlayState(this._playState);

  get play  => _playState;

  set play(IconData play){
    _playState = play;
    notifyListeners();
  }


  void changePlayState()
  {
    if(this._playState == Icons.play_arrow)
      {
        this.play = Icons.pause;
      }
      else{
        this.play = Icons.play_arrow;
    }

  }


}