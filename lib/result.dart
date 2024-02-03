import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultphrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'obese';
    } else if (result > 25 && result < 30) {
      resultText = 'OverWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: debugDisableShadows,
        home: Scaffold(
          backgroundColor: const Color(0xff1d113a),
          appBar: AppBar(
            backgroundColor: const Color(0xff1d113a),
            title: const Center(
              child: Text('RESULT' ,style: TextStyle(color: Colors.white),),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Gender : ${isMale ? 'Male' : 'Female'}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Result : ${result.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Healthiness : $resultphrase',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Age : $age',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
        ));
  }
}
