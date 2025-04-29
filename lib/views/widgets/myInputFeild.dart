

import 'package:flutter/material.dart';

class Myinputfeild extends StatelessWidget {
  const Myinputfeild({super.key, required this.labelText, required this.hint});

  final String labelText;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Color.fromARGB(255, 51,48,140),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),

        Container(
          alignment: Alignment.center,
          height: 60,
          padding: EdgeInsets.only(left: 20,right: 20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(241,244,253, 1), // couleur de fond
            borderRadius: BorderRadius.circular(12), // arrondi
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(
                color: Color.fromRGBO(102,116,145, 1),
                fontFamily: 'Gilroy',
                decoration: TextDecoration.none,
              ),

            ),
            style: TextStyle(
              color: Color.fromRGBO(102,116,145, 1),
              fontFamily: 'Gilroy',
              decoration: TextDecoration.none,
            ),
            keyboardType: TextInputType.text,
            cursorColor: Color.fromRGBO(102,116,145, 1),


          ),
        ),
      ],
    );
  }
}
