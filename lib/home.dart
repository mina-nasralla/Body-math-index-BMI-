import 'package:flutter/material.dart';
import 'package:bmi2/result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightval = 178;
  int weight = 80;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff84B7EE),
      appBar: AppBar(
        backgroundColor: const Color(0xff84B7EE),
        centerTitle: true,
        title: const Text("Body Mass Index"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              child: Row(
                children: [
                  m1Expanded(context, 'male'),
                  const SizedBox(
                    width: 5,
                  ),
                  m1Expanded(context, 'female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff080412)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text(heightval.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headlineMedium),
                          Text('cm',style: Theme.of(context).textTheme.headlineMedium),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: heightval.toDouble(),
                        onChanged: (newValue) => setState(()=>heightval=newValue)
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                children: [
                  m2Expanded(context, 'age'),
                  const SizedBox(
                    width: 5,
                  ),
                  m2Expanded(context, 'weight'),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff080412)),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextButton(
                onPressed: () {
                  var result = weight / pow(heightval / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, isMale: isMale, age: age)));
                },
                child: Text('Calculate',
                    style: Theme.of(context).textTheme.headlineMedium)),
          )
        ],
      )),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => isMale = (type == 'male') ? true : false);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff080412)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male_sharp : Icons.female,
                  color: const Color(0xff84B7EE), size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(type == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff080412)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(type == 'age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headlineMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                ),
                FloatingActionButton(
                  heroTag: 'age-',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add, size: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
