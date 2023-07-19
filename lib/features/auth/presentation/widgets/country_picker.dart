import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {

  const CountryPicker({Key? key   }) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  Country? country  ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(

          border: const OutlineInputBorder(),
          labelText:  "chose your country" ,
          suffix: country != null ? Text(country!.flagEmoji) :const SizedBox(width: 0,),
          hintText: country == null ? "chose your country" : country!.name
      ),
      onTap: (){
        showCountryPicker(context: context, onSelect: (country){
          setState(() {
            country = country ;
          });

        }) ;


      },

    );
  }
}
