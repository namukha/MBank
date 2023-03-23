// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:planner_app/screens/home_bloc.dart';
import 'package:planner_app/bloc/account_status_bloc.dart';
import 'package:planner_app/reusable_widgets/reusable_widget.dart';
import 'package:planner_app/screens/empty.dart';
import 'package:planner_app/screens/home_navigations/loan_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final bloc = HomeBloc();

  late List<AccountStatusState> accounts = [
    AccountStatusState(
        accIndex: '1',
        accountNum: '1234123412',
        accountType: 'Main Account',
        amount: '123456'),
    AccountStatusState(
        accIndex: '2',
        accountNum: '9000000009',
        accountType: 'Second Account',
        amount: '22222'),
    AccountStatusState(
        accIndex: '3',
        accountNum: '4040404403',
        accountType: 'Third Account',
        amount: '444'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          StreamBuilder<AccountStatusState>(
              initialData: accounts.first,
              stream: bloc.reloadAccountSt.stream,
              builder: (context, snapshot) {
                if (snapshot.data == null) return Container();
                return Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.tryParse('204'),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(28, 28, 30, 1)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(16)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data!.accountType),
                              Icon(Icons.flag_circle)
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            snapshot.data!.amount,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: double.tryParse('27')),
                          ),
                          Text(snapshot.data!.accountNum),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              miniButton(context, 'Details', true, Empty()),
                              SizedBox(
                                width: 20,
                              ),
                              miniButton(context, 'History', false, Empty()),
                            ],
                          )
                        ],
                      ),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          backgroundColor: Color(0xFF1C1C1E),
                          builder: (context) {
                            return Wrap(
                              children: [
                                ...accounts.map((a) {
                                  return Container(
                                      width: double.infinity,
                                      height: 74,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) =>
                                                        Color(0xFF2C2C2E)),
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(EdgeInsets.all(16)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)))),
                                        onPressed: () {
                                          bloc.reloadAccountSt.add(a);
                                        },
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(a.accountType),
                                              Text(a.accountNum)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(a.amount),
                                              Icon(Icons.flag_circle)
                                            ],
                                          )
                                        ]),
                                      ));
                                }),
                              ],
                            );
                          }),
                    ));
              }),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  width: 167,
                  height: double.tryParse('204'),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromRGBO(28, 28, 30, 1)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(16)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoanPage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Image.asset('assets/images/logoGreen.png', width: 60,),
                      SizedBox(height: 30),
                      Text('460000', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),
                      Text('1.2%', style: TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52))),
                      SizedBox(height: 24),
                      Text('Expiration date', style: TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52))),
                      Text('2023/09/25')
                    ]),
                  )),
              Container(),
            ],
          )
        ],
      ),
    );
  }
}
