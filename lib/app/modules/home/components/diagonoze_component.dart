import 'package:flutter/material.dart';
import 'package:yieldup/app/shared/components/custom_button.dart';

class DiagonozeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diagnoze"),
      ),
      body: Center(
        child: CustomButton(
          isActive: true,
          title: "Add image to diagnoze",
          onPressed: () {},
        ),
      ),
    );
  }
}
