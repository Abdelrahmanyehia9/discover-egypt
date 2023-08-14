import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../features/auth/presentation/view/coplete_info_view.dart';
import '../helper/sign_up_data.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, }) : super(key: key);
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2010 , 5),
        firstDate: DateTime(1920),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        AppInfoHelper.instance.datePicker = DateFormat.yMd().format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: (data){

          if (selectedDate == null ){

            return 'please choose date' ;
          }else{ return null  ; }

        },
        onTap: () {
          _selectDate(context);
          AppInfoHelper.instance.datePicker  = selectedDate.toString() ;
        },
        readOnly: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'pick date',
            hintText: selectedDate == null
                ? 'DD/MM/YYYY'
                : DateFormat.yMd().format(selectedDate!)),
      ),
    );
  }
}
