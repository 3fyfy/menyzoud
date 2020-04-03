import 'package:flutter/cupertino.dart';

class MainProvider  with ChangeNotifier{


   int _indexCarousel=0;

  int get indexCarousel=>_indexCarousel;

  set indexCarousel(value){

    _indexCarousel=value;
    notifyListeners();

  }


}