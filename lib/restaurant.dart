import 'package:flutter/material.dart';
import 'package:restauranttablebooking/bookedpage.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<String> images = [
    "assets/3 seater.jpg", "assets/3 seater.jpg", "assets/4 seater.jpg",
    "assets/4 seater.jpg", "assets/4 seater.jpg", "assets/4 seater.jpg"
    // "https://5.imimg.com/data5/MV/QN/MY-45376621/four-seater-dining-table-500x500.jpg",
    // "https://5.imimg.com/data5/MV/QN/MY-45376621/four-seater-dining-table-500x500.jpg",
    // "https://5.imimg.com/data5/MV/QN/MY-45376621/four-seater-dining-table-500x500.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 245, 234),
        title: Text(
          "Restaurant",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.builder(
          itemCount: images.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: ((context, index) {
            return Container(
              child: InkWell(
                child: Image.asset(images[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              BookedPage(imgUrl: images[index]))));
                },
              ),
            );
          })),
    );
  }
}
