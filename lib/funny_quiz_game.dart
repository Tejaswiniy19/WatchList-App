import 'package:flutter/material.dart';

class FunnyQuizGame extends StatefulWidget {
  const FunnyQuizGame({Key? key}) : super(key: key);

  @override
  State<FunnyQuizGame> createState() => _FunnyQuizGameState();
}

class _FunnyQuizGameState extends State<FunnyQuizGame> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "If cats could text, what would they mostly say?",
      "options": [
        "Feed me 😾",
        "I love you ❤️",
        "Where's my toy? 🐭",
        "Meow x1000 🐱"
      ],
      "answer": "Feed me 😾"
    },
    {
      "question": "What's the national sport of the internet?",
      "options": [
        "Scrolling endlessly 📱",
        "Football ⚽",
        "Chess ♟️",
        "Netflix marathon 🍿"
      ],
      "answer": "Scrolling endlessly 📱"
    },
    {
      "question": "If you drop a sandwich, which side will it fall on?",
      "options": [
        "Bread side 🍞",
        "Butter side 🧈",
        "Always the messy side 😅",
        "It hovers magically 🪄"
      ],
      "answer": "Always the messy side 😅"
    },
    {
      "question": "What do programmers love the most?",
      "options": [
        "Coffee ☕",
        "Semicolons ;",
        "Dark mode 🌙",
        "All of the above ✅"
      ],
      "answer": "All of the above ✅"
    },
    {
      "question": "If WiFi had a smell, what would it be?",
      "options": [
        "Fresh coffee ☕",
        "Burnt toast 🍞🔥",
        "Electricity ⚡",
        "Nothing 😶"
      ],
      "answer": "Fresh coffee ☕"
    },
    {
      "question": "What's the internet's favorite snack?",
      "options": ["Cookies 🍪", "Chips 🍟", "Memes 😂", "Spam 🍖"],
      "answer": "Cookies 🍪"
    },
  ];

  int _currentIndex = 0;
  int _score = 0;
  bool _answered = false;
  String _selected = "";
  bool _isFinished = false;

  void _checkAnswer(String option) {
    if (_answered || _isFinished) return;
    setState(() {
      _selected = option;
      _answered = true;
      if (option == _questions[_currentIndex]["answer"]) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _answered = false;
        _selected = "";
      });
    } else {
      setState(() {
        _isFinished = true;
      });
    }
  }

  void _restartGame() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _answered = false;
      _selected = "";
      _isFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isFinished) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 249, 250),
        appBar: AppBar(
          title: const Text("😂 Funny Quiz Game"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 6,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "🎉 Quiz Finished!",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Your Score: $_score / ${_questions.length}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _restartGame,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text("🔄 Restart"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final currentQ = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 237),
      appBar: AppBar(
        title: const Text("😂 Funny Quiz Game"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentQ["question"],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...(currentQ["options"] as List<String>).map<Widget>((opt) {
                  final isCorrect = opt == currentQ["answer"];
                  final isSelected = opt == _selected;

                  Color color = const Color.fromARGB(255, 227, 224, 224);
                  if (_answered && isSelected && isCorrect) {
                    color = const Color.fromRGBO(74, 210, 81, 1);
                  } else if (_answered && isSelected && !isCorrect) {
                    color = Colors.red.shade300;
                  }

                  return GestureDetector(
                    onTap: () => _checkAnswer(opt),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Colors.purple.shade200, width: 2),
                      ),
                      child: Text(
                        opt,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),
                if (_answered)
                  Column(
                    children: [
                      Text(
                        _selected == currentQ["answer"]
                            ? "🎉 Correct!"
                            : "😅 Oops! The right answer was: ${currentQ["answer"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Next ➡️"),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                Text(
                  "Score: $_score / ${_questions.length}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
