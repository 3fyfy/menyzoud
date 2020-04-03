import 'package:app/Core/services/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';




List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i));
  }

  return result;
}


class CarouselBalance extends StatefulWidget {
  final List<dynamic>images;

  CarouselBalance({ this.images}) ;


  @override
  _CarouselBalanceState createState() => _CarouselBalanceState(this.images);
}

class _CarouselBalanceState extends State<CarouselBalance> {

  static  int _current = 0;


  final List<dynamic>imgList;


  _CarouselBalanceState(this.imgList);


  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Column(children: [
      CarouselSlider(
        height:(MediaQuery.of(context).size.height/3),
        autoPlay: false,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        reverse: false,

        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        onPageChanged: (index) {
          setState(() {
            _current = index;
            mainProvider.indexCarousel=index;
          });
        },
        items: imgList.map((url) {
          return Container(
            child: ClipRRect(

              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Image.asset(url, fit: BoxFit.cover,),
            ),
          );
        },
        ).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: map<Widget>(imgList, (index) {
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border:new Border.all(color: Colors.transparent),
                shape: BoxShape.rectangle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Colors.deepPurple[100]),
          );
        },
        ),
      ),
    ]);
  }
}


