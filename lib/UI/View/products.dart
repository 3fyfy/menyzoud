import 'package:app/UI/View/productDetails.dart';
import 'package:app/UI/Widget/bgHome.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {

  final String image;
  final String title;

  Products(this.image,this.title);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  List<String>images=["images/bghome.jpg","images/bghome.jpg","images/room.jpg","images/bghome.jpg","images/bghome.jpg","images/room.jpg"];

  Widget   _buildGrid(){

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double heightItem=height*.4;

    return   Container(
      height: height-(MediaQuery.of(context).size.height/4+75),
      color: Colors.white,
      child:
      ListView(
        children: images.map((url) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.all(width*.02),

            child: Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(url,"كنبة سوداء"),));
                },
                child: Container(
                  padding: EdgeInsets.only(right:8,left:0),
                  child: Row(
                   children: <Widget>[
                     Image(image: AssetImage(url),height: heightItem*.6,width: width*.3,fit: BoxFit.contain,) ,
                     Column(
                       children: <Widget>[
                         Container(
                           width: width*.6,
                           padding: EdgeInsets.only(right: 8),
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
                           width: width*.6,
                           padding: EdgeInsets.only(right: 8),
                           child: Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,),
                         ),
                         Container(
                           width: width*.6,
                           alignment: Alignment.centerLeft,
                           child: Text("باقي من الزمن : ۳۰ ",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                         )

                       ],
                     )
                   ],


                  ),
                ),
              ),
            )


//            Column(
//              crossAxisAlignment: CrossAxisAlignment.end,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Image(image: AssetImage(url),height: heightItem*.6,width: width,fit: BoxFit.cover,),
//                Container(
//                  //height: heightItem*.1,
//                  width: width,
//                  padding:  EdgeInsets.only(right:8.0,top: heightItem*.02),
//                  child: Text("الاثاث",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
//                ),
//                Container(
//                  // height: heightItem*.1,
//                  width: width,
//                  padding: const EdgeInsets.only(right:8.0),
//                  child: Text("احدث المزادات على الاثاث",textAlign: TextAlign.right,),
//                )
//              ],
//            ),

          );
        }).toList(),
      ),
    );
  }

  Widget buildBg(){
    double heightBgHome= MediaQuery.of(context).size.height/4;
    double widthBgHome= MediaQuery.of(context).size.width;

    var controller;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        alignment: Alignment.topCenter,

        children: <Widget>[
          Container(
            height: heightBgHome+75,
            color: Colors.white,
            width: widthBgHome,

          ),


          Container(
            height: (heightBgHome)+35,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
              ),
            ),
          ),
          Container(
            height: (heightBgHome)+35,
            decoration: BoxDecoration(
              color: Color.fromRGBO(128,0,128,.7),
            ),
          ),

          Positioned(
              top: heightBgHome/2 ,

              child: Container(
                  child: Row(
                    children: <Widget>[
                      Text("من يزود ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),),
                      Text(", جميع ما تحتاجه في مكان واحد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  )
              )),

          Positioned(
              top: heightBgHome ,
              child: Container(
                  width: widthBgHome-widthBgHome*.1,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(.2, .3),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child:TextFormField(
                    controller: controller,
                    textDirection: TextDirection.ltr,
                    decoration:InputDecoration(
                        hintText:"البحث والفلترة",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                            gapPadding: 3
                        ),
                        hintStyle: TextStyle(fontSize: 16,),
                        prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: (){})
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  )
              )),

          Container(
              height: 50,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Colors.white), onPressed: (){

                    _scaffoldkey.currentState.openEndDrawer();

                  }),
                  Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,textDirection: TextDirection.ltr,), onPressed: (){
                    Navigator.of(context).pop();
                  }),

                ],
              )

          ),



        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double heightItem=height*.4;
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            buildBg(),
            _buildGrid()

          ],
        ),
      ),
      endDrawer: ListDrawer(),
    );
  }
}
