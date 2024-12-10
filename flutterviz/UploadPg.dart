///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class UploadPg extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
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
"Upload your recording!",
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
Expanded(
flex: 1,
child: 
SizedBox(
height:16,
width:MediaQuery.of(context).size.width,
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 5,horizontal:20),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: Text(
"Recording time: 0.00",
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
Text(
"Max: 1 hour",
textAlign: TextAlign.right,
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
padding:EdgeInsets.symmetric(vertical: 5,horizontal:20),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: Text(
"File size: 0B",
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
Text(
"Max: 64 MB",
textAlign: TextAlign.right,
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
padding:EdgeInsets.symmetric(vertical: 5,horizontal:0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:MediaQuery.of(context).size.height * 0.33,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
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
child:Text("Upload recording", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:MediaQuery.of(context).size.height * 0.12,
minWidth:MediaQuery.of(context).size.width * 0.6,
),
),
Expanded(
flex: 2,
child: 
SizedBox(
height:16,
width:MediaQuery.of(context).size.width,
),
),
],),
)
;}
}
