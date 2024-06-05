import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 500,
              width: 300,
              child: Image.asset('lib/assets/missingno.gif'),
            ),
          ),
          const Text(
            'Oops! A wild Missingno appeared...',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
