///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class InitialPg extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
body:Align(
alignment:Alignment.center,
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:MediaQuery.of(context).size.height * 0.25,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
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
child:Text("Login", style: TextStyle( fontSize:14,
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
child:Text("Register", style: TextStyle( fontSize:14,
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
child:Text("Continue as guest", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:MediaQuery.of(context).size.height * 0.1,
minWidth:MediaQuery.of(context).size.width * 0.6,
),
),
],),),
)
;}
}
