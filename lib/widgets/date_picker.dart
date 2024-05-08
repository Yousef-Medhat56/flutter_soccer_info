import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final DateTime shownDay;
  final void Function(DateTime date) onPickDayHandler;
  const DatePicker(
      {super.key, required this.shownDay, required this.onPickDayHandler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: shownDay,
          firstDate: DateTime(2017),
          lastDate: DateTime(DateTime.now().year + 1),
        );

        if (selectedDate != null) {
          onPickDayHandler(selectedDate);
        }
      },
      child: Icon(
        Icons.calendar_month_outlined,
        size: 28,
        color: Colors.green.shade300,
      ),
    );
  }
}
