part of 'chip_imput.dart';

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
    super.key,
    this.decoration = const InputDecoration(),
    this.initValue,
    this.onChanged,
    this.onSubmitted,
    this.chipLabelStyle,
    this.chipBackgroundColor,
    this.chipDeleteIconColor,
  });

  @override
  // ignore: library_private_types_in_public_api
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
        setState(() => focus = false);
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

    final decoracion =
        widget.decoration!.copyWith(contentPadding: const EdgeInsets.all(5));

    return InkWell(
      onTap: () {
        setState(() {
          focus = true;
        });
        myFocusNode.requestFocus();
      },
      child: InputDecorator(
        decoration: decoracion,
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
