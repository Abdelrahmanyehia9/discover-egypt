
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget mainAppBar({Color? backColor})=>AppBar(

elevation: 0,backgroundColor: backColor ?? Colors.transparent,
leading: InkWell(onTap: (){
Get.back() ;
},
child: Row(
children: const [
SizedBox(width: 12,) ,
CircleAvatar (
backgroundColor: Colors.white,
child: Icon(Icons.arrow_back)),
],
),
),
actions: const [
CircleAvatar(
backgroundColor: Colors.white,
child: Icon(Icons.favorite_outline),
) ,
SizedBox(width: 12,)
],


);