import 'package:flutter/material.dart';

import 'example_select_field.dart';
import 'exemple_imagen_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ExampleSelectField(),
    );
  }
}
