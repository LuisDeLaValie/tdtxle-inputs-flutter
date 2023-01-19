part of 'select_imput.dart';

class SelectField<T> extends StatefulWidget {
  final List<SelectItem<T>> items;
  final int debounce;
  final void Function(T)? onSelected;
  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final Widget? iconCloseButton;

  //* datos de texfield
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final void Function()? onTap;
  final MouseCursor? mouseCursor;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;

//* datos del contendor
  final double elevationLista;
  final AlignmentGeometry? alignmentLista;
  final EdgeInsetsGeometry? paddingLista;
  final Color? colorLista;
  final Decoration? decorationLista;
  final Decoration? foregroundDecorationLista;
  final double? widthLista;
  final double? heightLista;
  final BoxConstraints? constraintsLista;
  final EdgeInsetsGeometry? marginLista;
  final Matrix4? transformLista;
  final AlignmentGeometry? transformAlignmentLista;
  final Clip clipBehaviorLista;

  const SelectField({
    Key? key,
    required this.items,
    this.elevationLista = 0,
    this.debounce = 500,
    this.onSelected,
    this.showCloseButton,
    this.onCloseButton,
    this.iconCloseButton,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    //* container
    this.alignmentLista,
    this.paddingLista,
    this.colorLista,
    this.decorationLista,
    this.foregroundDecorationLista,
    this.widthLista,
    this.heightLista,
    this.constraintsLista,
    this.marginLista,
    this.transformLista,
    this.transformAlignmentLista,
    this.clipBehaviorLista = Clip.none,
  }) : super(key: key);

  @override
  State<SelectField<T>> createState() => _SelectFieldState<T>();
}

class _SelectFieldState<T> extends State<SelectField<T>> {
  final _values = ValueNotifier<List<SelectItem<T>>>([]);

  List<SelectItem<T>> _data = [];
  TextEditingController? controler;
  FocusNode? focus;
  Timer? _debounce;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    print("ppp:initState");
    _generar();
    _values.value = _data;

    print("controller: ${widget.controller}");
    controler = widget.controller ?? TextEditingController();
    print("focusNode: ${widget.focusNode}");
    focus = widget.focusNode ?? FocusNode();

    controler!.addListener(_filtarDatos);
  }

  /* @override
  void didUpdateWidget(SelectField<T> val) {
    if (widget.items != val.items) {
      print("ppp:didUpdateWidget");
      _generar();
      _values.value = _data;
    }

    // if (controler != val.controller) {
    //   var auxcontroler = widget.controller ?? TextEditingController();
    //   auxcontroler.text = controler!.text;
    //   controler = auxcontroler;

    //   val.controller?.removeListener(_filtarDatos);
    //   controler?.addListener(_filtarDatos);
    // }

    // var auxfocus = widget.focusNode ?? FocusNode();
    // if (focus!.hasFocus) {
    //   FocusScope.of(context).requestFocus(auxfocus);
    // }

    // focus = auxfocus;

    super.didUpdateWidget(val);
  } */

  @override
  void dispose() {
    // _focusNode.dispose();
    controler?.dispose();
    _values.dispose();
    super.dispose();
  }

  late Search chi;
  @override
  Widget build(BuildContext context) {
    print("ppp:build");

    chi = Search(
      values: _values,
      elevation: widget.elevationLista,
      textFiled: TextField(
        controller: controler,
        focusNode: focus,
        decoration: widget.decoration,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        style: widget.style,
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        textDirection: widget.textDirection,
        readOnly: widget.readOnly,
        toolbarOptions: widget.toolbarOptions,
        showCursor: widget.showCursor,
        autofocus: widget.autofocus,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        onAppPrivateCommand: widget.onAppPrivateCommand,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorColor: widget.cursorColor,
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        dragStartBehavior: widget.dragStartBehavior,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        onTap: ontap,
        mouseCursor: widget.mouseCursor,
        scrollController: widget.scrollController,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        scribbleEnabled: widget.scribbleEnabled,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      ),
      cuerpo: myCOntainer(
        alignment: widget.alignmentLista,
        padding: widget.paddingLista,
        color: widget.colorLista,
        decoration: widget.decorationLista,
        foregroundDecoration: widget.foregroundDecorationLista,
        width: widget.widthLista,
        height: widget.heightLista,
        constraints: widget.constraintsLista,
        margin: widget.marginLista,
        transform: widget.transformLista,
        transformAlignment: widget.transformAlignmentLista,
        clipBehavior: widget.clipBehaviorLista,
      ),
      showCloseButton: widget.showCloseButton,
      onCloseButton: widget.onCloseButton,
      iconCloseButton: widget.iconCloseButton,
      isOpen: (val) {
        setState(() => isOpen = val);
        controler?.text = controler?.text ?? "";
      },
    );

    return chi;
  }

  void ontap() {
    chi.taphandle.call();
    widget.onTap?.call();
  }

  /// metodo que vita que se sobre carge para evitar que se ejecute varias veces
  void debounce(void Function() callback) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(Duration(milliseconds: widget.debounce), callback);
  }

  void _generar() {
    var aux = widget.items.map((element) {
      return element.copyWith(onTap: () {
        widget.onSelected?.call(element.value);
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() => controler!.text = element.search);
        element.onTap?.call();
      });
    }).toList();
    _data = aux;
  }

  void _filtarDatos() {
    if (isOpen) {
      debounce(() {
        print("ppp:_filtarDatos");

        _values.value = _data.where((e) {
          var origen = e.search.toLowerCase();
          var bus = controler!.text.toLowerCase();
          return origen.contains(bus);
        }).toList();
      });
    }
  }
}
