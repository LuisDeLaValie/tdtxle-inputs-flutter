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
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ChipField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 80),
          ChipFormField<String>(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            
          ),
        ],
      ),
    );
  }
}
