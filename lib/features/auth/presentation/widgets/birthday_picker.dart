import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthDayPicker extends StatefulWidget {
  const BirthDayPicker({Key? key}) : super(key: key);

  @override
  State<BirthDayPicker> createState() => _BirthDayPickerState();
}

class _BirthDayPickerState extends State<BirthDayPicker> {
  DateTime? selectedDate ;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null ) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onTap: (){
          _selectDate(context);
        },
        readOnly: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'data of birth',
            hintText: selectedDate == null ? 'DD/MM/YYYY': DateFormat.yMd().format(selectedDate!)


        ),
      ),
    );
  }


}