import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/coplete_info_view.dart';
import '../helper/sign_up_data.dart';

class CountryPicker extends StatefulWidget {

  const CountryPicker({Key? key,  }) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  Country? country  ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if (SignUpUserInfo.instance.country == null){
          return "please chose country";
        }else {
          return null;
        }
      },
      readOnly: true,
      decoration: InputDecoration(

          border: const OutlineInputBorder(),
          suffix: country != null ? Text(country!.flagEmoji) :const SizedBox(width: 0,),
          hintText: country == null ? "chose your country" : country!.name
      ),
      onTap: (){
        showCountryPicker(context: context, onSelect: (value){
          setState(() {
            country = value ;
            SignUpUserInfo.instance.country = country!.name ;
          });

        }) ;


      },

    );
  }
}
