import 'package:flutter/material.dart';

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
// ::::::::::::::::::: ChipField ::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class ChipField<T> extends StatefulWidget {
  /// The decoration to show around the field.
  ///
  /// By default, draws a horizontal line under the text field but can be configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the extra padding introduced by the decoration to save space for the labels).
  final InputDecoration? decoration;

  /// Start the [ChipField], if it does not start it will appear empty
  final List<ChipItem<T>?>? initValue;

  final Function(List<ChipItem<T>?> val)? onChanged;
  final Function(List<ChipItem<T>?> val)? onSubmitted;

  /// The style to be applied to the chip's label.
  ///
  /// If null, the value of the [ChipTheme]'s [ChipThemeData.labelStyle] is used.
  ///
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  ///
  /// If [TextStyle.color] is a [MaterialStateProperty<Color>], [MaterialStateProperty.resolve]
  /// is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.disabled].
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.pressed].
  final TextStyle? chipLabelStyle;

  /// Color to be used for the unselected, enabled chip's background.
  ///
  /// The default is light grey.
  final Color? chipBackgroundColor;

  /// The [Color] for the delete icon chip's. The default is based on the ambient [Icon ThemeData.color].
  final Color? chipDeleteIconColor;

  const ChipField({
    Key? key,
    this.decoration = const InputDecoration(),
    this.initValue,
    this.onChanged,
    this.onSubmitted,
    this.chipLabelStyle,
    this.chipBackgroundColor,
    this.chipDeleteIconColor,
  }) : super(key: key);

  @override
  _ChipFieldState createState() => _ChipFieldState();
}

class _ChipFieldState extends State<ChipField> {
  List<ChipItem?> _lsitChip = [];
  bool focus = false;
  @override
  void initState() {
    _lsitChip = widget.initValue ?? [];
    super.initState();

    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus == false) {
        setState(() {
          focus = false;
        });
      }
    });
  }

  final textcontroler = TextEditingController();
  final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final cuerpu = Wrap(
      children: [
        ...listaChip(),
        if (focus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            constraints: const BoxConstraints(minWidth: 50, maxWidth: 100),
            child: TextField(
              focusNode: myFocusNode,
              controller: textcontroler,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: onChangedChip,
              onSubmitted: onSubmittedChip,
            ),
          )
      ],
    );
    return InkWell(
      onTap: () {
        setState(() {
          focus = true;
        });
        myFocusNode.requestFocus();
      },
      child: InputDecorator(
        decoration: widget.decoration!,
        isEmpty: !focus && _lsitChip.isEmpty,
        child: cuerpu,
      ),
    );
  }

  List<Widget> listaChip() {
    return _lsitChip
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Chip(
              labelStyle: widget.chipLabelStyle,
              backgroundColor: widget.chipBackgroundColor,
              deleteIconColor: widget.chipDeleteIconColor,
              //___________
              label: Text(e!.tex),
              onDeleted: () {
                setState(() {
                  _lsitChip.remove(e);
                });
              },
            ),
          ),
        )
        .toList();
  }

  void onChangedChip(String val) {
    if (val.contains(',')) {
      final str = val.substring(0, val.length - 1);
      _lsitChip.add(ChipItem(tex: str));
      textcontroler.text = "";
      if (widget.onChanged != null) widget.onChanged!(_lsitChip);
      setState(() {});
    }
  }

  void onSubmittedChip(String val) {
    _lsitChip.add(ChipItem(tex: val));
    textcontroler.text = "";
    if (widget.onChanged != null) widget.onChanged!(_lsitChip);
    if (widget.onSubmitted != null) widget.onSubmitted!(_lsitChip);
    setState(() {});
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::::::::::::::::: ChipFormField ::::::::::::::::::::::::::
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class ChipFormField<T> extends FormField<List<ChipItem<T>?>> {
  /// The decoration to show around the field.
  ///
  /// By default, draws a horizontal line under the text field but can be configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the extra padding introduced by the decoration to save space for the labels).
  final InputDecoration? decoration;

  /// An optional value to initialize the form field to, or null otherwise.
  @override
  // ignore: overridden_fields
  final List<ChipItem<T>>? initialValue;

  final Function(List<ChipItem<T>?> val)? onChanged;
  final Function(List<ChipItem<T>?> val)? onSubmitted;

  /// The style to be applied to the chip's label.
  ///
  /// If null, the value of the [ChipTheme]'s [ChipThemeData.labelStyle] is used.
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  ///
  /// If [TextStyle.color] is a [MaterialStateProperty<Color>], [MaterialStateProperty.resolve]
  /// is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.disabled].
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.pressed].
  final TextStyle? chipLabelStyle;

  /// Color to be used for the unselected, enabled chip's background.
  ///
  /// The default is light grey.
  final Color? chipBackgroundColor;

  /// The [Color] for the delete icon chip's. The default is based on the ambient [Icon ThemeData.color].
  final Color? chipDeleteIconColor;

  @override
  // ignore: overridden_fields
  final void Function(List<ChipItem<T>?>?)? onSaved;
  @override
  // ignore: overridden_fields
  final String? Function(List<ChipItem<T>?>?)? validator;

  ChipFormField({
    Key? key,
    this.decoration,
    this.onChanged,
    this.onSubmitted,
    this.chipLabelStyle,
    this.chipBackgroundColor,
    this.chipDeleteIconColor,
    this.onSaved,
    this.validator,
    this.initialValue,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<List<ChipItem<T>?>?> state) {
            return ChipField<T>(
              chipBackgroundColor: chipBackgroundColor,
              chipDeleteIconColor: chipDeleteIconColor,
              chipLabelStyle: chipLabelStyle,
              decoration: decoration,
              initValue: initialValue,
              onChanged: (val) {
                state.didChange(val);
                onChanged!(val);
              },
              onSubmitted: (val) {
                onChanged!(val);
                onSubmitted!(val);
                state.didChange(val);
              },
            );
          },
        );
}

class ChipDialog<T> extends StatefulWidget {
  final InputDecoration? decoration;
  final List<ChipItem> data;
  final Chip Function(ChipItem<T>? vlue) chipBuilder;
  final Chip Function(ChipItem<T>? vlue)? selectChipBuilder;
  final void Function(List<T> val) onChanged;
  const ChipDialog({
    Key? key,
    this.decoration,
    required this.data,
    required this.chipBuilder,
    this.selectChipBuilder,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ChipDialogState createState() => _ChipDialogState();
}

class _ChipDialogState extends State<ChipDialog> {
  String _value = "";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        showDialog<List<ChipItem>>(
          context: context,
          builder: (contex) {
            return _ChipDialog(
              data: widget.data,
              chipBuilder: widget.chipBuilder,
              selectChipBuilder: widget.selectChipBuilder ?? widget.chipBuilder,
            );
          },
        ).then((value) {
          if (value != null) {
            var values = value.map((e) => e.value).toList();
            var tex = value.map((e) => e.tex).toList();
            widget.onChanged(values);
            setState(() {
              _value = tex.join(',');
            });
          }
        });
      },
      child: InputDecorator(
        decoration: widget.decoration ?? const InputDecoration(),
        child: _value.isNotEmpty
            ? Text(
                _value,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      ),
    );
  }
}

class _ChipDialog extends StatefulWidget {
  final List<ChipItem> data;
  final Chip Function(ChipItem? theme) chipBuilder;
  final Chip Function(ChipItem? vlue) selectChipBuilder;

  const _ChipDialog({
    Key? key,
    required this.data,
    required this.chipBuilder,
    required this.selectChipBuilder,
  }) : super(key: key);

  @override
  State<_ChipDialog> createState() => __ChipDialogState();
}

class __ChipDialogState extends State<_ChipDialog> {
  List<int> activos = [];
  List<ChipItem> data = [];

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(onChanged: (value) {
            setState(() {
              data = widget.data
                  .where((element) =>
                      element.tex.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          }),
          const Divider(height: 10),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Wrap(
                children: generarData(),
              ),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(widget.data
                .where((element) => activos.contains(element.hashCode))
                .toList());
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }

  List<Widget> generarData() {
    return data
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
            child: GestureDetector(
              onTap: () {
                if (activos.contains(e.hashCode)) {
                  activos.remove(e.hashCode);
                } else {
                  activos.add(e.hashCode);
                }
                setState(() {});
              },
              child: activos.contains(e.hashCode)
                  ? widget.selectChipBuilder(e)
                  : widget.chipBuilder(e),
            ),
          ),
        )
        .toList();
  }
}
