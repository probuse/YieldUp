import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yieldup/app/modules/home/results/results_controller.dart';

class ResultsComponent extends StatefulWidget {
  @override
  _ResultsComponentState createState() => _ResultsComponentState();
}

class _ResultsComponentState
    extends ModularState<ResultsComponent, ResultsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: controller.imagesStore.selectedImage != null
                ? Image.file(
                    controller.imagesStore.selectedImage,
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Expanded(
            flex: 1,
            child: controller.imagesStore.result == null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No results yet.\n Diagnoze to receive a result.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18.0),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                        "${(controller.imagesStore.result.confidence * 100).toStringAsFixed(4)}% sure that the image is ${controller.imagesStore.result.label}")),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
