import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime dateTime = DateTime(2022, 12, 9, 5, 30);
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 137, 245, 234),
          title: Text("DateTimePicker")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Date and Time"),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: (() async {
                        final date = await pickDate();
                        if (date == null) return;

                        final newDateTime = DateTime(date.year, date.month,
                            date.day, dateTime.hour, dateTime.minute);

                        setState(() => dateTime = newDateTime);
                      }),
                      child: Text(
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}')),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: ElevatedButton(
                        onPressed: (() async {
                          final time = await pickTime();
                          if (time == null) return;

                          final newDateTime = DateTime(
                            dateTime.year,
                            dateTime.month,
                            dateTime.day,
                            time.hour,
                            time.minute,
                          );
                          setState(() => dateTime = newDateTime);
                        }),
                        child: Text("$hours:$minutes"))),
              ],
            ),
            ElevatedButton(
                onPressed: (() => showAlertDialog(context)),
                child: Text("Status")),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Booked Status"),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: Text("Table Booked")),
            ],
          );
        });
  }
}
