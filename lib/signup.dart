import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restauranttablebooking/authentication.dart';
import 'package:restauranttablebooking/loginpage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Signup"), actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginPage())));
            }),
            icon: Icon(Icons.menu),
          )
        ]),
        body: Column(children: [
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
                "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8="),
          ),
          TextField(
            decoration: InputDecoration(hintText: "EMail"),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            controller: emailController,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Password"),
            keyboardType: TextInputType.visiblePassword,
            maxLength: 15,
            controller: passwordController,
          ),
          ElevatedButton(
              onPressed: () async {
                await AuthenticationService(FirebaseAuth.instance)
                    .firebaseRegister(emailController.text.trim(),
                        passwordController.text.trim())
                    .then((value) {
                  if (value == "Signed up") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => LoginPage())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(value),
                      backgroundColor: Colors.red,
                    ));
                  }
                });
              },
              child: Text("Signup")),
        ]));
  }
}
