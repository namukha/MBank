import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/screens/home_screen.dart';

import '../bloc/auth_bloc.dart';
import '../reusable_widgets/reusable_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signUpWithEmailAndPassword(context) {
    BlocProvider.of<AuthBloc>(context).add(
      SigningUp(usernameController.text, passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            child: LinearProgressIndicator(
          value: 1,
        )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            return Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField('Username', Icons.person_2_outlined,
                        false, usernameController),
                    const SizedBox(
                      height: 15,
                    ),
                    reusableTextField('Password', Icons.lock_outline, true,
                        passwordController),
                    Spacer(),
                    signInSignUpButton(context, 'Sign In', true, () {
                      _signUpWithEmailAndPassword(context);
                    }),
                    SizedBox(
                      height: 20,
                    )
                  ]),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
