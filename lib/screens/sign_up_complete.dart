import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import './home_screen.dart';

class SignUpComplete extends StatelessWidget {
  const SignUpComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      child: Column(children: [
        Image.asset(
          'assets/images/signUpComplete.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Text(
            'Congratulations',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Text('You\'ve been succesfully signed up!', style: TextStyle(color: Colors.white),),
        Spacer(),
        Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: largeButton(context, 'Okay!', true, HomeScreen()),
        ),
      ]),
    ));
  }
}
