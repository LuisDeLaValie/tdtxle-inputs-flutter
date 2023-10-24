part of 'chip_imput.dart';

typedef SearchValue<T> = ValueNotifier<List<SelectItemBase<T>>>;

class ChipField<T> extends StatefulWidget {
  /// The decoration to show around the field.
  ///
  /// By default, draws a horizontal line under the text field but can be configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the extra padding introduced by the decoration to save space for the labels).
  final InputDecoration? decoration;

  /// Start the [ChipField], if it does not start it will appear empty
  final ChipListCallback<T>? initValue;

  final Function(ChipListCallback<T> val)? onChanged;
  final Function(ChipListCallback<T> val)? onSubmitted;

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

  final List<ChipItem<T>>? listaBase;

  const ChipField({
    super.key,
    this.decoration = const InputDecoration(),
    this.initValue,
    this.onChanged,
    this.onSubmitted,
    this.chipLabelStyle,
    this.chipBackgroundColor,
    this.chipDeleteIconColor,
    this.listaBase,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ChipFieldState<T> createState() => _ChipFieldState<T>();
}

class _ChipFieldState<T> extends State<ChipField<T>> {
  ChipListCallback<T> _lsitChip = [];
  bool focus = false;
  SearchValue<T> valuesSearch = SearchValue<T>([]);

  @override
  void initState() {
    _lsitChip = widget.initValue ?? [];
    super.initState();

    if (widget.listaBase != null) {
      filtrat("");
    }

    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus == false) {
        setState(() => focus = false);
        controller.close();
      }
    });
  } 

  @override
  void didUpdateWidget(covariant ChipField<T> oldWidget) {
    if (oldWidget.listaBase != this._lsitChip) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  final textcontroler = TextEditingController();
  final myFocusNode = FocusNode();
  final MenuDesplegableController<T> controller =
      MenuDesplegableController<T>();
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

    final decoracion = (widget.decoration ?? const InputDecoration())
        .copyWith(contentPadding: const EdgeInsets.all(5));

    late Widget body;

    if (widget.listaBase == null) {
      body = InkWell(
        onTap: () {
          setState(() => focus = true);
          myFocusNode.requestFocus();
        },
        child: InputDecorator(
          decoration: decoracion,
          isEmpty: !focus && _lsitChip.isEmpty,
          child: cuerpu,
        ),
      );
    } else {
      body = MenuDesplegableTextFiles(
        values: valuesSearch,
        controller: controller,
        widget: InkWell(
          onTap: () {
            setState(() => focus = true);
            myFocusNode.requestFocus();
            controller.open();
          },
          child: InputDecorator(
            decoration: decoracion,
            isEmpty: !focus && _lsitChip.isEmpty,
            child: cuerpu,
          ),
        ),
      );
    }

    return body;
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
              label: Text(e.tex),
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

  void filtrat(String filter) {
    final filtro = widget.listaBase!.where(
      (element) => element.tex.toLowerCase().contains(filter.toLowerCase()),
    );

    valuesSearch.value = filtro
        .map(
          (e) => SelectItemTap(
            value: e.value as T,
            search: e.tex,
            title: Text(e.tex),
            onTap: () {
              onChangedChip("${e.tex},");
            },
          ),
        )
        .toList();
  }

  void onChangedChip(String val) {
    if (widget.listaBase != null) {
      filtrat(val);
    }
    if (val.contains(',')) {
      final str = val.substring(0, val.length - 1);
      _lsitChip.add(ChipItem<T>(tex: str));
      textcontroler.text = "";

      if (widget.onChanged != null) widget.onChanged?.call(_lsitChip);
      // controller.open();
      
      setState(() {});
    }
  }

  void onSubmittedChip(String val) {
    // _lsitChip.add(ChipItem<T>(tex: val));
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
