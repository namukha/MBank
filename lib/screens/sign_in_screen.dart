import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/screens/sign_up_screenNew.dart';
import '../bloc/auth_bloc.dart';
// import 'package:planner_app/screens/sign_up_screen.dart';
import '../reusable_widgets/reusable_widget.dart';
import './home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signInWithEmailAndPassword(context) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<AuthBloc>(context).add(
          SigningIn(usernameController.text, passwordController.text),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: double.infinity,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      30, MediaQuery.of(context).size.height * 0.2, 30, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      logoWidget("assets/images/logoGreen.png"),
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
                        _signInWithEmailAndPassword(context);
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      largeButton(context, 'Sign Up', false, SignUpPage()),
                      SizedBox(
                        height: 20,
                      )
                    ]),
                  ),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
