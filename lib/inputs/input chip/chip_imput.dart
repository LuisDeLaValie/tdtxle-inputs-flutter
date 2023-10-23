import 'package:flutter/material.dart';


part 'chip_field.dart';
part 'chip_form_field.dart';

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::: Item del chipInput  ::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class ChipItem<T> {
  final T? value;
  final String tex;
  ChipItem({
    this.value,
    required this.tex,
  });
}



// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::: ChipFormField ::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
