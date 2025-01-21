///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'flutterViz_bottom_navigationBar_model.dart';


class DatabankPage extends StatelessWidget {
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

///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:MediaQuery.of(context).size.height * 0.1,
width:130,
fit:BoxFit.cover,
),
Expanded(
flex: 1,
child: 
SizedBox(
height:16,
width:16,
),
),
IconButton(
icon:Icon(
Icons.menu
),
onPressed:(){},
color:Color(0xff212435),
iconSize:24,
),
],),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:20),
child:Align(
alignment:Alignment.centerLeft,
child:Text(
"Global recordings",
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
),
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:MediaQuery.of(context).size.height * 0.25,
width:MediaQuery.of(context).size.width,
fit:BoxFit.fitWidth,
),

SizedBox(
height:MediaQuery.of(context).size.height * 0.05,
width:MediaQuery.of(context).size.width,
),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:30),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
labelText:"Search speaker",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
hintText:"Enter Text",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
IconButton(
icon:Icon(
Icons.search
),
onPressed:(){},
color:Color(0xff212435),
iconSize:24,
),
],),),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:30),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
labelText:"Search language",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
hintText:"Enter Text",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
IconButton(
icon:Icon(
Icons.search
),
onPressed:(){},
color:Color(0xff212435),
iconSize:24,
),
],),),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:30),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: TextField(
controller:TextEditingController(),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:1
),
),
labelText:"Search recording",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
hintText:"Enter Text",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xfff2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
IconButton(
icon:Icon(
Icons.search
),
onPressed:(){},
color:Color(0xff212435),
iconSize:24,
),
],),),
],),
)
;}
}