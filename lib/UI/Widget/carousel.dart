import 'package:app/Core/services/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';




List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i));
  }

  return result;
}


class CarouselImage extends StatefulWidget {
 final List<dynamic>images;

   CarouselImage({ this.images}) ;


  @override
  _CarouselImageState createState() => _CarouselImageState(this.images);
}

class _CarouselImageState extends State<CarouselImage> {

 static  int _current = 0;


  final List<dynamic>imgList;


  _CarouselImageState(this.imgList);


  @override
  Widget build(BuildContext context) {

    return Column(children: [
      CarouselSlider(
        height:(MediaQuery.of(context).size.height/3),
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        onPageChanged: (index) {
          setState(() {
            _current = index;
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


