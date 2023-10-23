import 'package:example/exemple_imagen_field.dart';
import 'package:flutter/material.dart';

import 'example_chip_input.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      // home: ExampleSelectField(),
      home: ExampleChipInput(),
    );
  }
}
