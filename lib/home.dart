import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen ,{super.key});

  final void Function() switchScreen;
  void onPressed() {switchScreen();}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "img/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(height:50),
          const Text(
            "Click here to start the quiz!",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: const Color.fromARGB(255, 167, 78, 183),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 11),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
                ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
