import 'package:flutter/material.dart';
import 'package:planner_app/models/loan_model.dart';
import 'package:planner_app/screens/home_navigations/repay_date.dart';
import '../../bloc/loan_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:finance/finance.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  late var loanbloc = LoanBloc(50000, 1, 50325);
  double amountSliderValue = 50000;
  double monthSliderValue = 1;

  List<LoanModel> loanlist() => [LoanModel(amount: '50000', months: '1')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Get Loan'),
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(28, 28, 30, 1),
                  borderRadius: BorderRadius.circular(12)),
              child: StreamBuilder<LoanBloc>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Column(children: [
                      Text(
                        'Amount /MNT/',
                        style: TextStyle(
                            color: Color.fromRGBO(245, 246, 247, 0.52)),
                      ),
                      Text(
                        amountSliderValue.truncate().toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 27,
                            color: Colors.white),
                      ),
                      Slider(
                          value: amountSliderValue
                              .roundToDouble()
                              .truncateToDouble(),
                          min: 50000,
                          max: 10000000,
                          divisions: 50,
                          onChanged: (double value) {
                            setState(() {
                              amountSliderValue = value;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '50\'000',
                            style: TextStyle(
                                color: Color.fromRGBO(245, 246, 247, 0.52)),
                          ),
                          Text(
                            '10\'000\'000',
                            style: TextStyle(
                                color: Color.fromRGBO(245, 246, 247, 0.52)),
                          )
                        ],
                      )
                    ]);
                  }),
            ), //// //// //// //// //// //// //// //// //// //// //// //// //// //// ////
            SizedBox(
              height: 16,
            ), //// //// //// //// //// //// //// //// //// //// //// //// //// //// ////
            Container(
              padding: EdgeInsets.all(16),
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(28, 28, 30, 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tenor',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    ),
                    Text(
                      monthSliderValue.truncate().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Slider(
                    value: monthSliderValue.roundToDouble(),
                    min: 1,
                    max: 30,
                    onChanged: (double value) {
                      setState(() {
                        monthSliderValue = value;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1 month',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    ),
                    Text(
                      '30 months',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    )
                  ],
                )
              ]),
            ), //// //// //// //// //// //// //// //// //// //// //// //// //// //// ////
            SizedBox(
              height: 16,
            ), //// //// //// //// //// //// //// //// //// //// //// //// //// //// ////
            Container(
              padding: EdgeInsets.all(16),
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(28, 28, 30, 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monthly Repayment:',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    ),
                    Text(
                      Finance.pmt(
                              rate: 0.012 / 12,
                              nper: monthSliderValue,
                              pv: amountSliderValue)
                          .truncate()
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interest Rate:',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    ),
                    Text(
                      '1.2%',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fee:',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                    ),
                    Text(
                      '1%',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ]),
            ),
            SizedBox(height: 20),
            Text('Repayment Date',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.all(16),
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 28, 30, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_right),
                      padding: EdgeInsets.all(0),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RepayPage()));
                      },
                    )
                  ],
                ))
          ],
        )));
  }
}
