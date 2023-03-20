import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Terms extends StatefulWidget {
  Terms(isReady, isChecked, ifReady, {super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  
  String date = DateFormat("yyyy.MM.dd").format(new DateTime.now());
  bool isChecked = false;
  bool isReady = false;
  final Function ifReady = () {};

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(
          'Terms & Conditions \n\n ${date} \n\n 1. М банкны үйлчилгээ авах, данс нээх, аппликэйшн ашиглах нөхцөл 👇 \n',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      Text(
        'Энэхүү эрх зүйн баримт бичиг нь М банк хаалттай хувьцаат компани (цаашид М банк, бид гэх) болон хэрэглэгч таны М банкны аппликэйшн ашиглах болон М банкнаас үзүүлэх бусад үйлчилгээний нөхцөлийг харилцан тохиролцох зорилготой. Та энэхүү үйлчилгээний нөхцөлтэй танилцаж зөвшөөрснөөр М банк аппликэйшнийг ашиглах боломжтой. Бидний энэхүү эрх зүйн харилцаа нь Монгол Улсын холбогдох хууль, тогтоомжоор зохицуулагдана. \n\n',
        style: TextStyle(color: Colors.white),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF00C7A3)),
            borderRadius: BorderRadius.circular(5)),
        child: CheckboxListTile(
          tileColor: Color(0xFF00C7A3),
          value: isChecked,
          title: const Text(
            'I agree terms & conditions.',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? true;
              isReady = value ?? true;
            });
            ifReady(isReady);
          },
        ),
      ),
      SizedBox(
        height: 20,
      )
    ]));
  }
}
