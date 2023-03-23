import 'package:flutter/material.dart';

class RepayPage extends StatefulWidget {
  const RepayPage({super.key});

  @override
  State<RepayPage> createState() => _RepayPageState();
}

class _RepayPageState extends State<RepayPage> {
  late String frequency = "Every Month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Repayment Date'),
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(28, 28, 30, 1),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Frequency',
                        style: TextStyle(
                            color: Color.fromRGBO(245, 246, 247, 0.52)),
                      ),
                      Text(
                        frequency,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ]),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  backgroundColor: Color(0xFF1C1C1E),
                  builder: (BuildContext context) {
                    return Column(children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xFF2C2C2E)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(16)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          onPressed: () {
                            setState(() {
                              frequency = 'Every Month';
                            });
                          },
                          child: Text('Every Month'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xFF2C2C2E)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(16)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          onPressed: () {
                            setState(() {
                              frequency = 'Every 2 Months';
                            });
                          },
                          child: Text('Every 2 Months'),
                        ),
                      )
                    ]);
                  });
            },
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(28, 28, 30, 1),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Repayment Date',
                    style:
                        TextStyle(color: Color.fromRGBO(245, 246, 247, 0.52)),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ]),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  backgroundColor: Color(0xFF1C1C1E),
                  builder: (BuildContext context) {
                    return Text('data');
                  });
            },
          ),
        ],
      )),
    );
  }
}
