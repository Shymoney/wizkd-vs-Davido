import 'package:flutter/material.dart';


class Counter with ChangeNotifier {
  int _counter;

  Counter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class PlayState with ChangeNotifier{
  IconData _playState;

  PlayState(this._playState);

  getPlay() => _playState;

  setPlay(IconData play) => _playState = play;

  void changePlayState()
  {
    if(this._playState == Icons.play_arrow)
      {
        this._playState = Icons.pause;
        notifyListeners();
      }
      else{
        _playState = Icons.play_arrow;
        notifyListeners();
    }

  }


}