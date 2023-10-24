// ignore_for_file: overridden_fields

part of 'menu_desplegable_text_files.dart';

class SelectItemBase<T> extends ListTile {
  final T value;
  final String search;

  const SelectItemBase({
    super.key,
    required this.value,
    required this.search,
    required super.title,
    super.subtitle,
    super.trailing,
    super.leading,
    super.enabled,
    super.onTap,
  });
}

/// Item primcipal del buscador
class SelectItem<T> extends SelectItemBase<T> {
  const SelectItem(
      {super.key,
      required super.value,
      required super.search,
      required super.title,
      super.subtitle,
      super.trailing,
      super.leading,
      super.enabled});
}

class SelectItemTap<T> extends SelectItemBase<T> {
  const SelectItemTap({
    super.key,
    required super.value,
    required super.search,
    required super.title,
    super.subtitle,
    super.trailing,
    super.leading,
    super.enabled,
    super.onTap,
  });
}
