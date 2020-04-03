import 'package:app/Core/services/mainProvider.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:app/UI/Widget/carousel.dart';
import 'package:app/UI/Widget/carouselBalance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recharge extends StatefulWidget {
  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  List<String>images=["images/visa.png","images/paypal.png","images/Mastercard.png",];
 static TextEditingController controllerInput=TextEditingController();


static Widget  BuildTextField(String title, String hint, TextEditingController controller,bool secure,
     TextInputType type){
   return  Column(
     children: <Widget>[
       Container(
         alignment: Alignment.centerRight,
         height: 70,
         padding: EdgeInsets.only(top: 20,bottom: 10,right: 8,left: 8),
         child: Text(title,style: TextStyle(fontSize: 15),),
       ),

       Padding(
         padding: const EdgeInsets.only(right: 8,left: 8),
         child: Directionality(
           textDirection: TextDirection.rtl,
           child: Center(
             child: TextFormField(
               validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
               keyboardType:type,
               obscureText: secure,
               textDirection: TextDirection.rtl,
               controller: controller,

               decoration:InputDecoration(
                 hintText:hint,
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     gapPadding: 3
                 ),
                 hintStyle: TextStyle(fontSize: 16,),
               ),
               cursorColor:Colors.purple,
             ),
           ),
         ),
       ),
     ],
   );
 }

Widget BuildBody(int index){
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;

  List<Widget>Deatails=[
    Form(
      child: Column(
        children: <Widget>[
          BuildTextField("اسم صاحب البطاقة", "اسم المستخدم", controllerInput , false, TextInputType.text),
          BuildTextField("رقم البطاقة", "5662422782", controllerInput , false, TextInputType.text),
          Container(
            width: width,
            child:   Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                    width:width/2-15,
                    child: BuildTextField("تاريخ الانتهاء", "", controllerInput , false, TextInputType.text)),

                Container(
                    width:width/2-15,
                    child: BuildTextField("CVV", " ", controllerInput , false, TextInputType.text)),

              ],

            ),
          ),
          BuildTextField("قيمة الرصيد المراد شحنه", "", controllerInput , false, TextInputType.text),
          Container(
            width: width,
            height: 50,
            margin: EdgeInsets.only(top: 30,),
            color: Theme.of(context).primaryColor,
            child: Center(child: Text("شحن رصيد",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
          )



        ],
      ),
    ),
    Form(
      child: Column(
        children: <Widget>[
          BuildTextField("الايميل", "اسم المستخدم", controllerInput , false, TextInputType.text),
          BuildTextField("الباسورد", " ", controllerInput , true, TextInputType.text),
          Container(
            width: width,
            height: 50,
            margin: EdgeInsets.only(top: 30,),
            color: Theme.of(context).primaryColor,
            child: Center(child: Text("طلب شحن رصيد",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    ),
    Form(
      child: Column(
        children: <Widget>[
          BuildTextField("اسم صاحب الحساب", "اسم المستخدم", controllerInput , false, TextInputType.text),
          BuildTextField(" رقم الحساب", "2827333772", controllerInput , false, TextInputType.text),

          BuildTextField("صورة الوصل", "ارفع صورة الوصل", controllerInput , false, TextInputType.text),
          Container(
            width: width,
            height: 50,
            margin: EdgeInsets.only(top: 30,),
            color: Theme.of(context).primaryColor,
            child: Center(child: Text("طلب شحن رصيد",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
          )

        ],
      ),
    ),

  ];

  return Deatails[index];
}


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    final mainProvider = Provider.of<MainProvider>(context);

    return Container(
      //-135-50-32

    width: width,
      child: ListView(
        children: <Widget>[
          CarouselBalance(images: images,),
          (mainProvider.indexCarousel==0)?BuildBody(0):(mainProvider.indexCarousel==1)?BuildBody(1):BuildBody(2)

        ],
      ),
    );
  }
}
