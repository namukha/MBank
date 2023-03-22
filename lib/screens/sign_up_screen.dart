import 'package:flutter/material.dart';
import 'package:planner_app/screens/sign_up_screens/bottom_modal.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:flutter_picker/flutter_picker.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
import './sign_up_complete.dart';
import './sign_up_screens/terms.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  bool _isChecked = false;
  bool _isReady = true;

  _ifReady(bool hi) {
    setState(() {
      _isReady = hi;
    });
  }

  List<Step> getSteps() => [
        Step(
            isActive: _currentStep >= 0,
            title: Text('1'),
            content: Terms(_isReady, _isChecked, _ifReady)),
        Step(
            isActive: _currentStep >= 1,
            title: Text('2'),
            content: RegisterModal()),
        Step(
            isActive: _currentStep >= 2,
            title: Text('3'),
            content: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF00C7A3)),
                  borderRadius: BorderRadius.circular(5)),
              child: CheckboxListTile(
                tileColor: Color(0xFF00C7A3),
                value: _isChecked,
                title: const Text(
                  'I agree terms & conditions.',
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? true;
                    _isReady = value ?? true;
                  });
                },
              ),
            )),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.black),
      child:
          // StepProgressIndicator nemeh
          Stepper( 
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Container(
              child: SizedBox(
            width: double.infinity,
            height: double.tryParse('52'),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => _isReady ? Colors.white : Color(0xFF2C2C2E)),
                foregroundColor: MaterialStateColor.resolveWith(
                    (states) => _isReady ? Colors.black : Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              // onPressed: _isReady ? controls.onStepContinue : null,
              onPressed: controls.onStepContinue,
              child: Text('Continue'),
            ),
          ));
        },
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: _currentStep,
        onStepContinue: () {
          final isLastStep = _currentStep == getSteps().length - 1;
          if (isLastStep) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpComplete()));
          } else {
            setState(() {
              _currentStep += 1;
              _isReady = false;
            });
          }
        },
        // onStepCancel: () => setState(() => _currentStep -= 1),
      ),
    ));
  }
}
