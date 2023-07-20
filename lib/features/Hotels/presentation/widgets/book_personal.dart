import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';

class BookPersonHotel extends StatelessWidget {
  BookPersonHotel({Key? key, required this.text, required this.num}) : super(key: key);
  final String text;
  int num ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          CustomText(text: text , fontWeight: FontWeight.bold, size: 18,) ,
          Row(
            children: [
              InkWell(onTap: (){
                num ++ ;
              },
                child: CircleAvatar(radius: 18,backgroundColor: mainColor,
                  child: const Icon(Icons.add , size: 16, color: Colors.white,),),
              )
              ,  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(num.toString() , style:const TextStyle(fontSize: 16 , )),
              ) ,
              InkWell(onTap: (){
                num -- ;
              },
                child:   CircleAvatar(radius: 18,backgroundColor: mainColor,
                  child: const Icon(Icons.remove , size: 16, color: Colors.white,),),
              )



            ],)

        ],


      ),
    );
  }
}
