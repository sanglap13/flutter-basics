import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: const Column(
        children: [
          //Calculator Display
          TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            keyboardAppearance: Brightness.dark,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 241, 241, 241)
                  
                  )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                  )
              ),
              hintText: "Enter a number",
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          )
          //Expand
          //Calculator Buttons
        ],
      ),
    );
  }
}