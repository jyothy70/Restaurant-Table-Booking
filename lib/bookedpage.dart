import 'package:flutter/material.dart';
import 'package:restauranttablebooking/datetimepicker.dart';

class BookedPage extends StatefulWidget {
  BookedPage({super.key, required this.imgUrl});
  String imgUrl;
  @override
  State<BookedPage> createState() => _BookedPageState();
}

class _BookedPageState extends State<BookedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 245, 234),
        title: Text(
          "BookedPage",
        ),
      ),
      body: Column(
        children: [
          Image.asset(widget.imgUrl),
          // Image.network(widget.imgUrl),
          ElevatedButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DateTimePicker())));
              }),
              child: Text("Book Date & Time")),
        ],
      ),
    );
  }
}











 



// _pickDate() async {
//   dynamic context;
//   // var pickedDate;

//   DateTime? date = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2021),
//     lastDate: DateTime(2023),
//   );
//   if (date != null) {
//     print('Date Selected: ${date.day}-${date.month}-${date.year}');
  


// void setState(Null Function() param0) {}

// setState(() {
//       pickedDate = date;
//     });