import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

class ExampleSelectField extends StatelessWidget {
  const ExampleSelectField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectField(
                settingsTextField: const SelectFieldSettings(
                  decoration: InputDecoration(
                    labelText: 'Select Field',
                    border: OutlineInputBorder(),
                  ),
                ),
                values: const [
                  SelectItem(value: '1', search: 'One', title: Text('One')),
                  SelectItem(value: '2', search: 'Two', title: Text('Two')),
                  SelectItem(value: '3', search: 'Three', title: Text('Three')),
                  SelectItem(value: '4', search: 'Four', title: Text('Four')),
                  SelectItem(value: '5', search: 'Five', title: Text('Five')),
                  SelectItem(value: '6', search: 'Six', title: Text('Six')),
                  SelectItem(value: '7', search: 'Seven', title: Text('Seven')),
                  SelectItem(value: '8', search: 'Eight', title: Text('Eight')),
                ],
                onSelected: (val) {
                  print("el valor es $val");
                },
              ),
              const SizedBox(height: 50),
              SelectFieldFuture(
                settingsTextField: const SelectFieldSettings(
                  decoration: InputDecoration(
                    labelText: 'Select Field Future',
                    border: OutlineInputBorder(),
                  ),
                ),
                values: (val) async {
                  final List<String> items = [
                    "One",
                    "Two",
                    "Three",
                    "Four",
                    "Five",
                    "Six",
                    "Seven",
                    "Eight",
                  ];
                  List<SelectItem> list = [];
                  for (var i = 0; i < items.length; i++) {
                    if (items[i].toLowerCase().contains(val.toLowerCase())) {
                      list.add(SelectItem(
                        value: i.toString(),
                        search: items[i],
                        title: Text(items[i]),
                      ));
                    }
                  }
                  return list;
                },
                onSelected: (val) {
                  print("el valor es $val");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
