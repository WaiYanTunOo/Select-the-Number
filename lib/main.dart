import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var ansState = ['Correct', 'InCorrect'];
  var showState = '';
  var score = 0;
  bool disable = false;

  void tryAgain() {
    score = 0;
    setState(() {
      disable = !disable;
      showState = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    var questionsNumbers = numbers..shuffle();
    List<int> answers = questionsNumbers.sublist(0, 3);
    var imgNumbers = answers..shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select the Number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(children: [
            Text('Please select ${questionsNumbers.first}',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                disable
                    ? null
                    : setState(() {
                        if (questionsNumbers.first == imgNumbers.elementAt(0)) {
                          showState = ansState[0];
                          score += 10;
                        } else {
                          showState = ansState[1];
                          disable = true;
                        }
                      });
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${imgNumbers.elementAt(0).toString()}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                disable
                    ? null
                    : setState(() {
                        if (questionsNumbers.first == imgNumbers.elementAt(1)) {
                          showState = ansState[0];
                          score += 10;
                        } else {
                          showState = ansState[1];
                          disable = true;
                        }
                      });
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${imgNumbers.elementAt(1).toString()}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                disable
                    ? null
                    : setState(() {
                        if (questionsNumbers.first == imgNumbers.elementAt(2)) {
                          showState = ansState[0];
                          score += 10;
                        } else {
                          showState = ansState[1];
                          disable = true;
                        }
                      });
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${imgNumbers.elementAt(2).toString()}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Your answer is $showState'),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                child: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  primary: disable
                      ? Colors.red
                      : Colors.green, // This is what you need!
                ),
                onPressed: () => tryAgain()),
            const SizedBox(
              height: 15,
            ),
            Text('Score : ${score.toString()}'),
          ]),
        ),
      ),
    );
  }
}
