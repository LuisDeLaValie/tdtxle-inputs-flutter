import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

class ExampleChipInput extends StatelessWidget {
  const ExampleChipInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chip Input"),
      ),
      body: const Column(
        children: [
          SizedBox(height: 50),
          ChipField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 150),
          // ChipFormField(),
        ],
      ),
    );
  }
}
