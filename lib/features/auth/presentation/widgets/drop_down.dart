import 'package:flutter/material.dart';
import '../../../../core/helper/sign_up_data.dart';
import '../view/coplete_info_view.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? _dropDownValue;

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
      items: [
        'Male',
        'Female',
      ].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
          () {
            _dropDownValue = val;
            if (_dropDownValue == 'Male') {
              AppInfoHelper.instance.isMale = true;
            } else {
              AppInfoHelper.instance.isMale = false;
            }
          },
        );
      },
    );
  }
}
