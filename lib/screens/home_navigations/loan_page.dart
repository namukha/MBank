import 'package:flutter/material.dart';
import 'package:planner_app/models/loan_model.dart';
import '../../bloc/loan_bloc.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  final loanbloc = LoanBloc(50000, 1, 50325);
  double amountSliderValue = 50000;
  double monthSliderValue = 1;

  List<LoanModel> loanlist() => [LoanModel(amount: '50000', months: '1')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
            child: Column(
          children: [
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      amountSliderValue.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 27,
                          color: Colors.white),
                    ),
                    Slider(
                        value: amountSliderValue.roundToDouble(),
                        min: 50000,
                        max: 10000000,
                        divisions: 200,
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
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '10\'000\'000',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ]);
                }
              ),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      monthSliderValue.roundToDouble().toString(),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '30 months',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ]),
            ),
          ],
        )));
  }
}
