import 'package:flutter/material.dart';
import 'package:yieldup/app/modules/home/components/diagonoze_component.dart';
import 'package:yieldup/app/modules/home/components/results_component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [DiagonozeComponent(), ResultsComponent()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: "Diagnoze",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Results",
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
