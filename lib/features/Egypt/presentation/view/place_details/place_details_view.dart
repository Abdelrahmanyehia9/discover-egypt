import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/data/model/place_model.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details/things_to_do.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../auth/presentation/widgets/custom_buttom.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({Key? key, required this.model}) : super(key: key);
  final PlaceModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mainAppBar(),
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: dimHeight(context) * .4,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: model.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    bottom: 8,
                    left: 8,
                    child: CustomText(
                      text: model.name,
                      size: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            pCustomTile(
                text: "things to do",
                icon: Icons.camera,
                onTap: () {
                  Get.to(() => ThingsToDoView(
                        model: model,
                      ));
                }),
            pCustomTile(
                onTap: () {

                  Get.defaultDialog(

                    titlePadding: const EdgeInsets.symmetric(vertical: 18),
                    titleStyle: TextStyle(fontWeight: FontWeight.w900 , color: mainColor),
                    contentPadding: const EdgeInsets.only(right: 28 , left: 28 , bottom: 28),
                      title: 'Info about ${model.name}',
                      content: Column(

                        children: [
                          SizedBox(
                              height: dimHeight(context) * 0.2,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: model.image,
                                placeholder: (context, url) =>
                                    Image.asset(placeHolder),
                              )),
                          const SizedBox(
                            height: 12,
                          ),
                           CustomText(
                            color: Colors.grey.shade600,
                              text: model.overview ,
                           size:  9, fontWeight: FontWeight.bold, ) ,
                          const SizedBox(height: 12,) ,
                          pCustomRow(tittle:  'Language :'  ,subTittle: 'AR${model.languge}' )  ,
                          pCustomRow(tittle:  'crowded :'  ,subTittle: model.crowded ) ,
                          pCustomRow(tittle:  'Space :'  ,subTittle: model.space )  ,
                        ],
                      ));

                },
                text: "information about city",
                icon: Icons.info_outline),
            pCustomTile(text: "Weather", icon: Icons.sunny),
            pCustomTile(text: "top places", icon: Icons.pin_drop_rounded , onTap: (){
              Get.to(()=>ThingsToDoView(model: model ,view: true))  ;
            }),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                text: "Book TourGuide",
                color: mainColor,
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
