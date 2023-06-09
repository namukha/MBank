import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/bloc/account_status_bloc.dart';
import 'package:planner_app/screens/home_navigations/mhub.dart';
import 'package:planner_app/screens/home_navigations/shiljuuleg.dart';
import 'package:planner_app/screens/sign_in_screen.dart';
import './home_navigations/account.dart';
import '../bloc/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      AccountPage(),
      TransferPage(),
      MHubPage(),
    ];

    // // // // // // // // // // // // // // // // // // // // // // // //
    return BlocProvider<AccountStatusBloc>(
        create: (context) => AccountStatusBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                context.read<AuthBloc>().add(SigningOut());
              },
            ),
            title: user.email != null ? Text(user.email!) : Text('Your Name'),
            actions: [
              Icon(Icons.remove_red_eye_outlined),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.notifications)
            ],
          ),
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              }
            },
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
              items: [
                DotNavigationBarItem(
                    icon: Image.asset('assets/icons/iconM.png'),
                    selectedColor: Color(0xFF00C7A3)),
                DotNavigationBarItem(
                    icon: Image.asset('assets/icons/iconArrow.png'),
                    selectedColor: Color(0xFF00C7A3)),
                DotNavigationBarItem(
                  icon: Image.asset('assets/icons/iconCategories.png'),
                ),
              ],
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF00C7A3),
              unselectedItemColor: Color.fromRGBO(245, 245, 247, 0.6),
              backgroundColor: Color.fromRGBO(44, 44, 46, 0.9),
              dotIndicatorColor: Color.fromRGBO(44, 44, 46, 0.9),
              borderRadius: 26,
              enablePaddingAnimation: false,
              paddingR: EdgeInsets.all(6),
              marginR: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25)),
        ));
  }
}
