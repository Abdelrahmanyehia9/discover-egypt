import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../features/auth/presentation/view/coplete_info_view.dart';

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
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        SignUpUserInfo.birthDate = DateFormat.yMd().format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(

        child: TextFormField(
          validator: (data){

            if (selectedDate == null ){

              return 'this field required' ;
            }else{ return null  ; }

          },
          onTap: () {
            _selectDate(context);
            SignUpUserInfo.birthDate  = selectedDate.toString() ;
          },
          readOnly: true,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'data of birth',
              hintText: selectedDate == null
                  ? 'DD/MM/YYYY'
                  : DateFormat.yMd().format(selectedDate!)),
        ),
      ),
    );
  }
}
