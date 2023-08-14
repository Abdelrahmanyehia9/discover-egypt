import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/material_color.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/hotel_view_model.dart';

import '../../../../core/helper/sign_up_data.dart';

class RangeTimePicker extends StatefulWidget {
  const RangeTimePicker({Key? key, required this.globalKey}) : super(key: key);
  final GlobalKey<FormState> globalKey;

  @override
  State<RangeTimePicker> createState() => _RangeTimePickerState();
}

class _RangeTimePickerState extends State<RangeTimePicker> {
  DateTimeRange? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        firstDate: DateTime.now().add(const Duration(days: 1)),
        lastDate: DateTime(2101),
        builder: (BuildContext context, dynamic child) {
          return FittedBox(
            child: Theme(
              data: ThemeData(
                  primaryColor: Colors.purple[300],
                  primarySwatch: PrimaryColor.primary),
              child: child,
            ),
          );
        });

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        BookHotelViewModel.range = selectedDate!.start ;
        AppInfoHelper.instance.numOfDays = selectedDate!.end.difference(selectedDate!.start).inHours ~/ 24 ;
         print(selectedDate.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: SizedBox(
        child: TextFormField(
          validator: (data) {
            if (selectedDate == null) {
              return "field required";
            } else {
              return null;
            }
          },
          onTap: () {
            _selectDate(context);
          },
          readOnly: true,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'choose period',
              hintText: selectedDate == null
                  ? 'choose period'
                  : "${(selectedDate!.end.difference(selectedDate!.start).inHours / 24).toStringAsFixed(0)} days"),
        ),
      ),
    );
  }
}
