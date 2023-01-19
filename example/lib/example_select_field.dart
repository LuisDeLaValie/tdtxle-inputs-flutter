import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

// ignore: must_be_immutable
class ExampleSelectField extends StatelessWidget {
  ExampleSelectField({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Field'),
      ),
      // ignore: prefer_const_constructors
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SelectField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              heightLista: 150,
              elevationLista: 8,
              showCloseButton: true,
              items: List.generate(
                20,
                (index) => SelectItem(
                  value: "value$index",
                  search: "value$index",
                  title: Text("value$index"),
                ),
              ),
              onChanged: (p0) => print("onChanged: $p0"),
              onSelected: (p0) => print("onSelected: $p0"),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
      ),
    );
  }
}
