import 'package:flutter/material.dart';
import 'package:yieldup/app/modules/home/diagnoze/components/diagonoze_component.dart';
import 'package:yieldup/app/modules/home/components/results_component.dart';

class HomePage extends StatefulWidget {
  final int selectedIndex;

  const HomePage({Key key, this.selectedIndex = 0}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex;

  @override
  void initState() {
    print(">>>>>>>>>>>>>>. i run");
    _currentIndex = widget.selectedIndex;
    super.initState();
    print("??????????????? i fail witjh ${widget.selectedIndex}");
  }

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
