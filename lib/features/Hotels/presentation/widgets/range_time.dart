import 'package:flutter/material.dart';

class RangeTimePicker extends StatefulWidget {
  const RangeTimePicker({Key? key}) : super(key: key);

  @override
  State<RangeTimePicker> createState() => _RangeTimePickerState();
}

class _RangeTimePickerState extends State<RangeTimePicker> {
  DateTimeRange? selectedDate ;

  Future<void> _selectDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null ) {
      setState(() {
        selectedDate = picked;
        print(selectedDate.toString()) ;
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
        decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'choose period',
            hintText: selectedDate == null ? 'choose period': "${(selectedDate!.end.difference(selectedDate!.start).inHours/24).toStringAsFixed(0)} days"



        ),
      ),
    );
  }


}