import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/data/model/place_model.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details/things_to_do.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details/weather.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guide.dart';
import '../../../../constant.dart';
import '../../../../core/utils/main_app_bar.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../auth/presentation/widgets/custom_buttom.dart';
import '../../../home/presentation/controller/favourite.dart';

class PlaceDetailsView extends StatefulWidget {
  const PlaceDetailsView({Key? key, required this.model, this.view}) : super(key: key);
  final PlaceModel model;
  final bool? view ;

  @override
  State<PlaceDetailsView> createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mainAppBar(
          liked: widget.model.isLiked,
          favOnTap: (){
            if(widget.model.isLiked == true){
              FavouriteController().removeFavouritePlace(model: widget.model) ;

            }else{
              PlacesViewModel().addToMyFavourite(model: widget.model) ;
            }

            setState(() {
              widget.model.isLiked = !(widget.model.isLiked) ;

            }
        );}),
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: dimHeight(context) * .4,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.model.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: 8,
                    left: 8,
                    child: CustomText(
                      text: widget.model.name,
                      size: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            widget.view == null ?   pCustomTile(
                text: "things to do",
                icon: Icons.camera,
                onTap: () {
                  Get.to(() => ThingsToDoView(
                        model: widget.model,
                      ));
                }) :const SizedBox(),
            pCustomTile(
                onTap: () {

                  showDialog(useSafeArea: false,
                    context: context, builder: (context)=>AlertDialog(

                      actions: [
                        InkWell(
                          onTap:(){
                            Get.back() ;
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomText(text:"cancel" , color: mainColor,size: 18,fontWeight: FontWeight.bold,),
                          ),
                        )
                      ],

                      titlePadding: const EdgeInsets.only(top: 18),
                      contentPadding: const EdgeInsets.all(12),
                      title: Center(child: CustomText(text:"info about ${widget.model.name}" , fontWeight: FontWeight.bold,size: 24, color: mainColor,)),
                    content: SingleChildScrollView(
                      child: Column(
mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: dimHeight(context) * 0.2,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: widget.model.image,
                                placeholder: (context, url) =>
                                    Image.asset(placeHolder),
                              )),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomText(
                            color: Colors.grey.shade600,
                            text: widget.model.overview ,
                            size:  12, fontWeight: FontWeight.bold, ) ,
                          const SizedBox(height: 12,) ,
                          pCustomRow(tittle:  'Language :'  ,subTittle: 'AR${widget.model.languge}' )  ,
                          pCustomRow(tittle:  'crowded :'  ,subTittle: widget.model.crowded ) ,
                          pCustomRow(tittle:  'Space :'  ,subTittle: widget.model.space )  ,
                        ],
                      ),
                    )),
                  );

                },
                text: "information about city",
                icon: Icons.info_outline),
            pCustomTile(text: "Weather", icon: Icons.sunny , onTap: (){
              Get.to(()=>WeatherView(model: widget.model)) ;
            }),
           widget.view == null ? pCustomTile(text: "Prices", icon: Icons.monetization_on , onTap: (){
              Get.to(()=>ThingsToDoView(model: widget.model ,view: true))  ;
            }) : SizedBox(height: dimHeight(context)*0.22,),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: InkWell(
                onTap: (){
                  Get.to(()=>const AllTourGuide()) ;
                },
                child: CustomButton(
                  text: "Book TourGuide",
                  color: mainColor,
                ),
              ),
            )
          ],
        ));
  }

  Widget pCustomTile(
          {required String text,
          required IconData icon,
          GestureTapCallback? onTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18),
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            tileColor: Colors.white,
            leading: Icon(
              icon,
              color: mainColor,
            ),
            title: CustomText(
              text: text,
              size: 18,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );

  Widget pCustomRow({required String tittle  , required String subTittle})=>SizedBox(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.start ,
      children: [
        SizedBox( width: 68,
            child: CustomText(text: tittle , fontWeight: FontWeight.bold, size: 12,)) ,
        const SizedBox(width: 18,) ,
        CustomText(text: subTittle ,size: 10, color: Colors.grey.shade700,)

      ],
    ),
  );
}
