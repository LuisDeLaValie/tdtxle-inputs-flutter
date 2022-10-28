import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

// ignore: must_be_immutable
class ExampleSelectField extends StatelessWidget {
  ExampleSelectField({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              SelectField<String>(
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
                onSelected: (val) {},
                showCloseButton: true,
              ),
              const SizedBox(height: 50),
              SelectFieldFuture(
                settingsTextField: SelectFormFieldSettings(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: "TeléfonoSL"),
                  validator: (val) {
                    String? msg;
                    var aux = val?.replaceAll('-', '');
                    if ((aux ?? "").isEmpty) {
                      msg = "Ingrese telefono";
                    } else if (aux?.length != 10) {
                      msg = "Numero no valido";
                    }

                    return msg;
                  },
                ),
                values: (val) async {
                  List<SelectItem<dynamic>> aa = [
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                    const SelectItem(
                        value: 1,
                        search: "777-777-7777",
                        title: Text("777-777-7777")),
                  ];
                  return aa;
                },
              ),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.text = "t";
        },
      ),
    );
  }
}
