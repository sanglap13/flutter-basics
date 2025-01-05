import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

 

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int firstNumber = 0;
  int secondNumber = 0;
  num result = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

   late final AppLifecycleListener _listener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = firstNumber.toString();
    displayTwoController.text = secondNumber.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

   void _onShow() { print("onShow"); }
  void _onHide() { print("onHide"); }
  void _onResume() { print("onResume"); }
  void _onDetach() { print("onDetach"); }
  void _onInactive() { print("onInactive"); }
  void _onPause() { print("onPause"); }
  void _onRestart() { print("onRestart"); }
  void _onStateChange(AppLifecycleState state) {
    print("onStateChange: $state");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          //Calculator Display
         CalculatorDisplay(hint: "Enter 1st number", controller: displayOneController),

         SizedBox(height: 16.0),

         CalculatorDisplay(hint: "Enter 2nd number", controller: displayTwoController),

         const SizedBox(
            height: 32.0,
         ),

         Text(
          result.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.bold
          ),
         ),

         Spacer(),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            FloatingActionButton(
              shape: CircleBorder(),
              elevation: 8.0,
              backgroundColor: const Color(0xFF247FFF),
              onPressed: () {
                setState(() {
                   result = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                });
              }, 
              child: const Icon(CupertinoIcons.add , 
              color: Colors.white),
            ),
            FloatingActionButton(
              shape: CircleBorder(),
              elevation: 8.0,
            backgroundColor: const Color(0xFF247FFF),
              onPressed: () {
                setState(() {
                   result = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                });
              }, 
              child: const Icon(CupertinoIcons.minus,
               color: Colors.white),
            ),
            FloatingActionButton(
              shape: CircleBorder(),
              elevation: 8.0,
             backgroundColor: const Color(0xFF247FFF),
              onPressed: () {
                setState(() {
                   result = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                });
              }, 
              child: const Icon(CupertinoIcons.multiply, 
               color: Colors.white),
            ),
            FloatingActionButton(
              shape: CircleBorder(),
              elevation: 8.0,
             backgroundColor: const Color(0xFF247FFF),
              onPressed: () {
                setState(() {
                   result = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                });
              }, 
              child: const Icon(CupertinoIcons.divide,
               color: Colors.white),
            ),
           ]),

            const SizedBox(
              height: 16.0,
            ),

           FloatingActionButton.extended(
             elevation: 8.0,
             backgroundColor: const Color(0xFF247FFF),
            onPressed:() {
              setState(() {
                displayOneController.clear();
                displayTwoController.clear();
                result = 0;
                firstNumber = 0;
                secondNumber = 0;
              });
            } ,
            label: const Text("Clear",
            style: TextStyle(
              color: Colors.white
            ),
            ),
           )
         
          //Expand
          //Calculator Buttons
        ],
      ),
    );
  }
}


class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
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
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          );
  }
}