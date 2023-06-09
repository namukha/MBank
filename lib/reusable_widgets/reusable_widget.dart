import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
// import '../utils/color_utils.dart';

Image logoWidget(String imageName) {
  return Image.asset(imageName);
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: !isPasswordType
        ? (value) {
            return value != null && !EmailValidator.validate(value)
                ? "Enter a valid email"
                : null;
          }
        : (value) {
            return value != null && value.length < 6
                ? "Enter min. 6 characters"
                : null;
          },
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: icon != Icons.abc
          ? Icon(
              icon,
              color: const Color.fromRGBO(85, 89, 94, 1),
            )
          : null,
      labelText: text,
      labelStyle: const TextStyle(color: Color.fromRGBO(85, 89, 94, 1)),
      filled: true,
      fillColor: const Color(0xFF1C1C1E),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xFF21cda8),
            width: 2.0,
          )),
      suffixIcon: IconButton(icon: Icon(Icons.cancel), onPressed: () {
        controller.clear();
      },),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    context, String type, bool isLogin, Function onTap) {
  return Container(
      child: SizedBox(
    width: double.infinity,
    height: double.tryParse('52'),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => isLogin ? Colors.white : Color(0xFF2C2C2E)),
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => isLogin ? Colors.black : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      onPressed: onTap(),
      child: Text(type),
    ),
  ));
}

Container largeButton(context, String type, bool isLogin, Widget nextScreen) {
  return Container(
      child: SizedBox(
    width: double.infinity,
    height: double.tryParse('52'),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => isLogin ? Colors.white : Color(0xFF2C2C2E)),
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => isLogin ? Colors.black : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => nextScreen)));
      },
      child: Text(type),
    ),
  ));
}

Container miniButton(context, String type, bool isWhite, Widget nextScreen) {
  return Container(
      child: SizedBox(
    height: double.tryParse('36'),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => isWhite ? Colors.white : Color(0xFF2C2C2E)),
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => isWhite ? Colors.black : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => nextScreen)));
      },
      child: Text(type),
    ),
  ));
}
