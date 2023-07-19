import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();

}
class _DropDownMenuState extends State<DropDownMenu> {
  String? _dropDownValue ;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: _dropDownValue == null
          ? const Text('Please Choose Your Gender')
          : Text(
        _dropDownValue!,

      ),
      isExpanded: true,
      iconSize: 30.0,
      items: ['Male', 'Female', ].map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val ),

          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropDownValue = val;
          },
        );
      },
    );
  }}