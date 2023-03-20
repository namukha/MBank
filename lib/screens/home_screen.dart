import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/bloc/account_status_bloc.dart';
import './home_navigations/account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      AccountPage(),
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Text(
            'shiljuuleg',
            style: TextStyle(color: Colors.white),
          )),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Text('hehe'),
      ),
    ];

    // // // // // // // // // // // // // // // // // // // // // // // //
    return BlocProvider<AccountStatusBloc>(
        create: (context) => AccountStatusBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            title: Text('Your Name'),
            actions: [
              Icon(Icons.remove_red_eye_outlined),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.notifications)
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
              items: [
                DotNavigationBarItem(
                    icon: Image.asset('assets/icons/iconM.png')),
                DotNavigationBarItem(
                    icon: Image.asset('assets/icons/iconArrow.png')),
                DotNavigationBarItem(
                    icon: Image.asset('assets/icons/iconCategories.png')),
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
