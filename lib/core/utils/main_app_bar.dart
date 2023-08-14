import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget mainAppBar({Color? backColor, bool? view , GestureTapCallback? favOnTap , bool?  liked = false}) => AppBar(
      elevation: 0,
      backgroundColor: backColor ?? Colors.transparent,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Row(
          children: const [
            SizedBox(
              width: 12,
            ),
            CircleAvatar(
                backgroundColor: Colors.white, child: Icon(Icons.arrow_back)),
          ],
        ),
      ),
      actions: [
        view == null
            ? InkWell(
          onTap: favOnTap,
              child:  CircleAvatar(
                  backgroundColor: Colors.white,
                  child:  Icon(
                      liked == false ? Icons.favorite_outline : Icons.favorite),
                ),
            )
            : const SizedBox(),
        const SizedBox(
          width: 12,
        )
      ],
    );
