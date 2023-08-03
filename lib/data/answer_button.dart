import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({required this.ansText, required this.onTap, super.key});
  final String ansText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          backgroundColor: const Color.fromARGB(255, 167, 78, 183),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        ansText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
