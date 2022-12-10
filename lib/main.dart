import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restauranttablebooking/loginpage.dart';

import 'package:restauranttablebooking/restaurant.dart';
import 'package:restauranttablebooking/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 10, 243, 219), Colors.white],
            begin: Alignment.bottomRight),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/restaurant 1.jpg"),
            // Image.network(
            //     "https://5.imimg.com/data5/MV/QN/MY-45376621/four-seater-dining-table-500x500.jpg"),
            // "https://cdn2.vectorstock.com/i/1000x1000/64/01/cartoon-businessman-notebook-order-food-restaurant-vector-25076401.jpg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Text("Table Booking",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 40,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                )),
            ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                }),
                child: Text("Signup")),
            ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LoginPage())));
                }),
                child: Text("Login")),

            FloatingActionButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RestaurantScreen())));
              }),
              child: Icon(Icons.next_plan),
            )
          ]),
    ));
  }
}
