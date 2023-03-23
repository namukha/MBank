import 'package:flutter/material.dart';
import 'package:planner_app/screens/sign_up_screen.dart';
import '../reusable_widgets/reusable_widget.dart';
import './home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                30, MediaQuery.of(context).size.height * 0.2, 30, 0),
            child: Column(children: [
              logoWidget("assets/images/logoGreen.png"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField('Username', Icons.person_2_outlined, false,
                  usernameController),
              const SizedBox(
                height: 15,
              ),
              reusableTextField(
                  'Password', Icons.lock_outline, true, passwordController),
              Spacer(),
              largeButton(context, 'Sign In', true, HomeScreen()),
              SizedBox(
                height: 15,
              ),
              largeButton(context, 'Sign Up', false, SignUpScreen()),
              SizedBox(
                height: 20,
              )
            ]),
          )),
    );
  }
}
