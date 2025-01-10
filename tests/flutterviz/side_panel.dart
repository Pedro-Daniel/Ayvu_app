///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class SidePanel extends StatelessWidget {

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
Padding(
padding:EdgeInsets.symmetric(vertical: 10,horizontal:0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
IconButton(
icon:Icon(
Icons.account_circle
),
onPressed:(){},
color:Color(0xff212435),
iconSize:50,
),
Text(
"My profile",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),),
Padding(
padding:EdgeInsets.symmetric(vertical: 10,horizontal:0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
IconButton(
icon:Icon(
Icons.keyboard_voice
),
onPressed:(){},
color:Color(0xff212435),
iconSize:50,
),
Text(
"My recordings",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),),
Padding(
padding:EdgeInsets.symmetric(vertical: 10,horizontal:0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
IconButton(
icon:Icon(
Icons.settings
),
onPressed:(){},
color:Color(0xff212435),
iconSize:50,
),
Text(
"Settings",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),),
Padding(
padding:EdgeInsets.symmetric(vertical: 10,horizontal:0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
IconButton(
icon:Icon(
Icons.code
),
onPressed:(){},
color:Color(0xff212435),
iconSize:50,
),
Text(
"About devs",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),),
],),),
)
;}
}