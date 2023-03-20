import 'package:flutter/material.dart';
import 'package:planner_app/reusable_widgets/reusable_widget.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController regController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: TextField(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: reusableTextField(
                  'Number', Icons.abc, false, regController),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
