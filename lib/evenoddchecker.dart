import 'package:flutter/material.dart';

class EvenOdd extends StatefulWidget {
  const EvenOdd({super.key});

  @override
  State<EvenOdd> createState() => _EvenOddState();
}

class _EvenOddState extends State<EvenOdd> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  void checkEvenOdd() {
    if (numberController.text.isEmpty) {
      setState(() {
        result = 'Please enter a number!';
      });
      return;
    }

    int number = int.parse(numberController.text);

    setState(() {
      if (number % 2 == 0) {
        result = 'The number $number is Even.';
      } else {
        result = 'The number $number is Odd.';
      }
    });
  }

  void clearFields() {
    setState(() {
      numberController.clear();
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Even or Odd Checker',style: TextStyle(color: Colors.white, fontSize:20),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a Number',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: checkEvenOdd,
                  child: Text('Check'),
                ),
                ElevatedButton(
                  onPressed: clearFields,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Clear'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
