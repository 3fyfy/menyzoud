import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/carousel.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {

  final String image;
  final String title;

  ProductDetails(this.image,this.title);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  List<String>images=["images/room.jpg","images/bghome.jpg","images/room.jpg"];

  TextEditingController controller=TextEditingController();
  bool alert=true;

  Widget verticationAlert(){
    return AlertDialog(
      content:Container(
        height: 100,
        child: Center(
          child: Text("سيتم خصم ريال من محفظتك, هل انت متأكد ؟${controller.text}"),
        ),
      ),

      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),

      actions: <Widget>[
        InkWell(
          onTap: (){
            setState(() {
              alert=true;
            });

          },
          child: Row(
            textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 140,
              child: Center(child: Text("تأكيد",style:TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))),
          Container(
              width: 140,
              child: Center(child: Text("الغاء",style:TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))),
        ],

          ),
        ),
      ],
    );
  }

  Widget addBonus(){
    return AlertDialog(
      title: new Text("ادخل قيمة المزايدة",style:TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      content:Container(
        width: 50,
        padding: EdgeInsets.only(top:8,bottom: 8,left: 70,right: 70),
        child: TextFormField(
          keyboardType:TextInputType.number,
          textDirection: TextDirection.rtl,
          controller: controller,
          cursorColor: Theme.of(context).primaryColor,
        ),
      ),
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),

      actions: <Widget>[
       InkWell(
         onTap: (){
           setState(() {
             alert=false;
           });
         },
         child: Container(
            width:MediaQuery.of(context).size.width,
            height: 50,
            padding: EdgeInsets.all(0),
           margin: EdgeInsets.all(0),
           color: Theme.of(context).primaryColor,
            child: Center(child: Text("اضافة مزايدة",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
          ),
       ),
      ],
    );

  }



  Widget _buildItemBottomTimer(String title,String content){
    double width=MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 5,right: 5),
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
          title: Text("كنبة سوداء"),
          backgroundColor: Theme.of(context).primaryColor,
          //leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
          centerTitle: true,

          actions: <Widget>[
            IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
              _scaffoldkey.currentState.openEndDrawer();
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
                    Row(
                      children: <Widget>[
                        Text("كنبة سوداء",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                        Icon(Icons.archive,color: Colors.black38,),
                      ],
                    ),
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
                padding: EdgeInsets.only(right: width*.01,left:width*.01),

                child: Row(
                  children: <Widget>[
                    Container(
                      width: width*.67,
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
                                  Text(" 34 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("يوم ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 34 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("ساعة ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 34 :",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("دقيقة ")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(" 34 ",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                                  Text("ثانية ")
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return (alert)?addBonus():verticationAlert();
                          },
                        );                      },
                      child: Container(
                        width: width*.3,
                        height: 100,
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("اضافة مزايدة",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                           Icon(Icons.add,color: Colors.white)


                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width*.04,left:width*.04),
                margin: EdgeInsets.only(top: 8,bottom: 8),
                width: width,
                height: width*.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width/2-width*.04-.5,
                      height: width*.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildItemBottomTimer("بداية المزاد", "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}"),
                          _buildItemBottomTimer("نهاية المزاد", "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}"),
                          _buildItemBottomTimer("الحد الادنى لبدأ المزاد", "100 ريال"),
                          _buildItemBottomTimer("عدد المزايدين", "800 مزايد"),


                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Colors.black38,
                      height: width*.4,
                    ),
                    Container(
                      width: width/2-width*.04-.5,
                      height: width*.5,

                      alignment: Alignment.topRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildItemBottomTimer("حالة  المزاد", "لا يوجد رسوم للمزايدة"),
                          _buildItemBottomTimer("اعلى مزايدة", "800 ريال"),
                          _buildItemBottomTimer("مزايدك الاخيرة", "1000 ريال"),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:width*.04,right:width*.04,top: 8,bottom: 8 ),
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RoutePaths.Mozaydeen);

                    },
                    child: Text("عرض جميع المزايدات",style: TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline,fontSize: 15),)),
              )

            ],
          ),
        ),
        drawer: ListDrawer(),

      ),
    );
  }
}
