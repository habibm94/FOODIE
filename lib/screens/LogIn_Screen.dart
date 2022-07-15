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
        padding: EdgeInsets.only(top: 150),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text('Username'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
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
