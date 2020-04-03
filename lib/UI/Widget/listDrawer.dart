import 'package:app/Core/constants/app_contstant.dart';
import 'package:flutter/material.dart';


class ListDrawer extends StatefulWidget {
  @override
  _ListDrawerState createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {

  Widget _biuldItemDrawer(String title,IconData icon,String root){

    return Column(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Divider(endIndent: 50,color:Colors.purple,),
        Directionality(
          textDirection: TextDirection.rtl,
          child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(root);
            },
            child: ListTile(
              title: Text(title,style: TextStyle(color:Colors.purple,fontSize: 15,fontWeight: FontWeight.bold),),
              leading: Icon(icon,color:Colors.purple ,),
            ),
          ),
        ) ,
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(

        children: <Widget>[
          Container(
            color: Colors.white70,
            height:height*.35 ,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height:height*.3*.1 ,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(RoutePaths.Profile);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/bghome.jpg",),

                    radius: height*.3*.3,
                  ),
                ),
                Text("اسم المستخدم",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text("evample@gmail.com",style: TextStyle(fontSize: 15))
              ],
            ),
          ),
          _biuldItemDrawer("الرئيسية",Icons.home,RoutePaths.Home),
          _biuldItemDrawer("محفظتي",Icons.view_stream,RoutePaths.MyPocket),
          _biuldItemDrawer("مزايداتي",Icons.pan_tool,RoutePaths.Mazadaty),
          _biuldItemDrawer("الحسابات البنكية الخاصة بالتطبيق",Icons.vpn_key,RoutePaths.AccountsBank),
          _biuldItemDrawer("المحادثة المباشر",Icons.message,""),
          _biuldItemDrawer("الشروط والاحكام",Icons.view_stream,RoutePaths.ConditionsAndRules),
          _biuldItemDrawer("اتصل بنا",Icons.group,RoutePaths.CallUs),
          _biuldItemDrawer("عن من يزود",Icons.error,RoutePaths.About),
          Column(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Divider(endIndent: 50,color:Colors.purple,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  title: Text("تسجيل خروج",style: TextStyle(color:Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.exit_to_app,color:Colors.red ,),
                ),
              ) ,
            ],
          )



        ],
      ),
    );
  }
}

