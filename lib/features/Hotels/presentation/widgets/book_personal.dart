import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';

import '../../../../constant.dart';
import '../../../../core/helper/sign_up_data.dart';
import '../../../../core/widgets/custom_text.dart';

class BookPersonHotel extends StatefulWidget {
  BookPersonHotel({Key? key, required this.text, required this.num})
      : super(key: key);
  final String text;

  int num;

  @override
  State<BookPersonHotel> createState() => _BookPersonHotelState();
}

class _BookPersonHotelState extends State<BookPersonHotel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: widget.text,
            fontWeight: FontWeight.bold,
            size: 18,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.text == "Adults") {
                      AppInfoHelper.instance.adults++;
                    } else {
                      AppInfoHelper.instance.children++;
                    }
                    widget.num++;
                  });
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: mainColor,
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(widget.num.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    )),
              ),
              InkWell(
                onTap: () {
                  if (widget.num != 1 && widget.text == "Adults") {
                    setState(() {
                      widget.num--;
                      AppInfoHelper.instance.adults--;
                    });
                  } else if (widget.num != 0 && widget.text != "Adults") {
                    setState(() {
                      widget.num--;
                      AppInfoHelper.instance.children--;
                    });
                  }
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: mainColor,
                  child: Icon(
                    Icons.remove,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
