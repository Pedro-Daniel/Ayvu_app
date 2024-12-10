///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'flutterViz_bottom_navigationBar_model.dart';


class AboutPg extends StatelessWidget {
List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems = [FlutterVizBottomNavigationBarModel(icon:Icons.home,label:"Home"), FlutterVizBottomNavigationBarModel(icon:Icons.account_circle,label:"Account")];

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
bottomNavigationBar: BottomNavigationBar(
items: flutterVizBottomNavigationBarItems.map((FlutterVizBottomNavigationBarModel item) {
return BottomNavigationBarItem(
icon: Icon(item.icon),
label: item.label
, );
 }).toList(),
backgroundColor: Color(0xffffffff),
currentIndex: 0,
elevation: 8,
iconSize: 24,
selectedItemColor: Color(0xff3a57e8),
unselectedItemColor: Color(0xff9e9e9e),
selectedFontSize: 14,
unselectedFontSize:14,
showSelectedLabels: true,
showUnselectedLabels: true,
onTap: (value){},
),
body:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

IconButton(
icon:Icon(
Icons.arrow_back_ios
),
onPressed:(){},
color:Color(0xff212435),
iconSize:24,
),
Expanded(
flex: 1,
child: Text(
"Help us make a better AYVU!",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:30),
child:Text(
"The Ayvu Project consists of a set of tools that collect language data through audio recordings and a geographic reference of where the person acquired a particular  way of communicating. Available through a mobile application, Ayvu enables individuals with no prior technological knowledge to access and use these utilities. As a matter of fact “Ayvu” means “language” in Tupi Guarani, a language from the indigenous native Brazilians.",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:0),
child:MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Visit our Github", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:MediaQuery.of(context).size.height * 0.1,
minWidth:MediaQuery.of(context).size.width * 0.6,
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:0),
child:MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Visit the devs socials", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:MediaQuery.of(context).size.height * 0.1,
minWidth:MediaQuery.of(context).size.width * 0.6,
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:0),
child:MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Report a bug", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:MediaQuery.of(context).size.height * 0.1,
minWidth:MediaQuery.of(context).size.width * 0.6,
),
),
],),
)
;}
}
