import 'package:flutter/material.dart';

import '../../util/menu_desplegable_text_files.dart';

part 'chip_field.dart';
part 'chip_form_field.dart';

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::: Item del chipInput  ::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

typedef ChipListCallback<T> = List<ChipItem<T>>;

class ChipItem<T> {
  final T? value;
  final String tex;
  ChipItem({
    this.value,
    required this.tex,
  });
}
