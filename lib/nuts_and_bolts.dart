import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: NutsAndBoltsPuzzle(),
    debugShowCheckedModeBanner: false,
  ));
}

class NutsAndBoltsPuzzle extends StatefulWidget {
  const NutsAndBoltsPuzzle({super.key});

  @override
  State<NutsAndBoltsPuzzle> createState() => _NutsAndBoltsPuzzleState();
}

class _NutsAndBoltsPuzzleState extends State<NutsAndBoltsPuzzle> {
  final int itemCount = 6;
  late List<int> nuts;
  late List<int> bolts;
  late Map<int, bool> matched; // key = nut index, value = matched or not

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    nuts = List.generate(itemCount, (index) => index);
    bolts = List.from(nuts);
    matched = {};
    bolts.shuffle(Random());
    nuts.shuffle(Random());
  }

  void _restartGame() {
    setState(() {
      _initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          'Nuts & Bolts Puzzle',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _restartGame,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Drag nuts to matching bolts!',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildNutsRow(),
            const SizedBox(height: 50),
            _buildBoltsRow(),
            const SizedBox(height: 30),
            if (matched.length == itemCount)
              const Text(
                '🎉 Puzzle Solved!',
                style: TextStyle(color: Colors.greenAccent, fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: nuts.map((nut) {
        bool isMatched = matched[nut] == true;
        return Draggable<int>(
          data: nut,
          feedback: _buildNutBoltBox('Nut ${nut + 1}', Colors.orange,
              isDragging: true),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: _buildNutBoltBox('Nut ${nut + 1}', Colors.orange),
          ),
          child: isMatched
              ? const SizedBox(width: 60)
              : _buildNutBoltBox('Nut ${nut + 1}', Colors.orange),
        );
      }).toList(),
    );
  }

  Widget _buildBoltsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: bolts.map((bolt) {
        bool isMatched = matched[bolt] == true;
        return DragTarget<int>(
          onWillAccept: (nut) => !isMatched,
          onAccept: (nut) {
            if (nut == bolt) {
              setState(() {
                matched[nut] = true;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('❌ Wrong match! Try again.'),
                  backgroundColor: Colors.redAccent,
                  duration: const Duration(milliseconds: 600),
                ),
              );
            }
          },
          builder: (context, candidateData, rejectedData) {
            return isMatched
                ? _buildNutBoltBox('✓ Bolt ${bolt + 1}', Colors.green)
                : _buildNutBoltBox('Bolt ${bolt + 1}', Colors.blue);
          },
        );
      }).toList(),
    );
  }

  Widget _buildNutBoltBox(String label, Color color,
      {bool isDragging = false}) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDragging ? color.withOpacity(0.7) : color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isDragging
            ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
