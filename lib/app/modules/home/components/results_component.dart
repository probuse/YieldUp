import 'package:flutter/material.dart';

class ResultsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Center(child: Text("Lets view the results")),
    );
  }
}