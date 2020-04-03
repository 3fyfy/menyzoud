import 'package:app/UI/Widget/carousel.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSuccess extends StatefulWidget {

  final String image;
  final String title;
  final bool success;

  ProductSuccess(this.image,this.title,this.success);

  @override
  _ProductSuccessState createState() => _ProductSuccessState();
}

class _ProductSuccessState extends State<ProductSuccess> {

  List<String>images=["images/room.jpg","images/bghome.jpg","images/room.jpg"];

  Widget _buildItemBottomTimer(String title,String content){
    double width=MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.only(top:8.0,bottom: 8,right: width*.04,left:width*.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.amber,
              ),
              SizedBox(width: 5,),
              Text(title,style: TextStyle(fontSize: width*.03,color: Colors.black38),),
            ],
          ),
          Expanded(child: Text(content,style: TextStyle(fontSize: width*.03),maxLines: 1,textAlign: TextAlign.left,))

        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text("كنبة سوداء",style: TextStyle(color: Theme.of(context).primaryColor),),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor,textDirection: TextDirection.ltr,), onPressed: (){
              Navigator.of(context).pop();
            }),
          ],
        ),


        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: <Widget>[
              CarouselImage(images: images,),
              Container(
                padding: EdgeInsets.only(right: width*.04,left:width*.04),
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("كنبة سوداء",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                    Row(
                      children: <Widget>[
                        Text("٥۰۰ ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.red),),
                        Text("ريال "),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(right: width*.04,left:width*.04),
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
              ),
              Container(
               // padding: EdgeInsets.only(right: width*.04,left:width*.04),
                margin: EdgeInsets.only(top: 8,bottom: 8),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width-width*.04,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildItemBottomTimer("بداية المزاد", "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}"),
                          _buildItemBottomTimer("نهاية المزاد", "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}"),
                          _buildItemBottomTimer("الحد الادنى لبدأ المزاد", "100 ريال"),
                          _buildItemBottomTimer("عدد المزايدين", "800 مزايد"),
                          _buildItemBottomTimer("حالة  المزاد", "لا يوجد رسوم للمزايدة"),
                          _buildItemBottomTimer("اعلى مزايدة", "800 ريال"),
                          _buildItemBottomTimer("مزايدك الاخيرة", "1000 ريال"),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width*.01,left:width*.01),

                child: Row(
                  children: <Widget>[
                    Container(
                      width: width-width*.02,
                      height: 100,
                      color: Colors.black12,
                      child: Column(
                        children: <Widget>[
                          Text("الوقت المتبقي"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 00 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("يوم ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 00 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("ساعة ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 00 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("دقيقة ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 00 ",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("ثانية ")
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              (!widget.success)? Container(
                width: width,
                height: 50,
                margin: EdgeInsets.only(top: 30,),
                color: Theme.of(context).primaryColor,
                child: Center(child: Text("اضافة مزايدة جديدة",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
              ):Container(height: 0,width: 0,)


            ],
          ),
        ),
        drawer: ListDrawer(),

      ),
    );
  }
}
