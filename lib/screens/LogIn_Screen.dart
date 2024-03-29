import 'package:flutter/material.dart';
import 'package:foodie/widgets/authScreensCurveClipper.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 150),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 50, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///title
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ///username textfiel
                    TextField(
                      decoration: InputDecoration(
                          label: const Text('Username'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///password textfield
                    TextField(
                      decoration: InputDecoration(
                          label: const Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ///log in button
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              ///bottom curved bar
              ClipPath(
                clipper: WaveClipperTwo(reverse: true, flip: false),
                child: Container(
                  height: 150,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ]),
      ),
    );
  }
}
