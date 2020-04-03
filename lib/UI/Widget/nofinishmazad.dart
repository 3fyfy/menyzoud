import 'package:app/UI/Widget/productsuccess.dart';
import 'package:flutter/material.dart';

class NoFinishMazad extends StatefulWidget {
  @override
  _NoFinishMazadState createState() => _NoFinishMazadState();
}

class _NoFinishMazadState extends State<NoFinishMazad> {
  List<String>images=["images/bghome.jpg","images/bghome.jpg","images/room.jpg","images/bghome.jpg","images/bghome.jpg","images/room.jpg"];


  Widget   _buildGrid(){

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double heightItem=height*.4;

    return   ListView(
      children: images.map((url) {
        return Card(
            elevation: 6,
            margin: EdgeInsets.all(width*.02),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductSuccess(url,"كنبة سوداء",false),));
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
                            child: Text("باقي من الزمن : ۳۰ ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),textAlign: TextAlign.left,),
                          )

                        ],
                      )
                    ],


                  ),
                ),
              ),
            )

        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildGrid();
  }
}
