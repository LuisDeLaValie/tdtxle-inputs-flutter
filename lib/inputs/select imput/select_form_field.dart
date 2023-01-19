part of 'select_imput.dart';

class SelectFormField<T> extends FormField<T> {
  SelectFormField({
    super.key,
    required this.items,
    double elevationLista = 0,
    int debounce = 500,
    void Function(T)? onSelected,
    bool? showCloseButton,
    void Function()? onCloseButton,
    Widget? iconCloseButton,
    this.controller,
    FocusNode? focusNode,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    bool autofocus = false,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    MaxLengthEnforcement? maxLengthEnforcement,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    void Function(String)? onSubmitted,
    void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    void Function()? onTap,
    MouseCursor? mouseCursor,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints = const <String>[],
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    bool scribbleEnabled = true,
    bool enableIMEPersonalizedLearning = true,
    AlignmentGeometry? alignmentLista,
    EdgeInsetsGeometry? paddingLista,
    Color? colorLista,
    Decoration? decorationLista,
    Decoration? foregroundDecorationLista,
    double? widthLista,
    double? heightLista,
    BoxConstraints? constraintsLista,
    EdgeInsetsGeometry? marginLista,
    Matrix4? transformLista,
    AlignmentGeometry? transformAlignmentLista,
    Clip clipBehaviorLista = Clip.none,
    super.onSaved,
    super.validator,
    T? initialValue,
    AutovalidateMode? autovalidateMode,
  }) : super(
          //  initialValue: controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<T> field) {
            final _SelectFormFieldState<T> state =
                field as _SelectFormFieldState<T>;
            final InputDecoration effectiveDecoration =
                (decoration ?? const InputDecoration());

            state.setItems(items);

            // ignore: no_leading_underscores_for_local_identifiers
            void _onSelect(T val) {
              onSelected?.call(val);
              // field.didChange(val);
              field.setValue(val);
            }

            return SelectField<T>(
              items: items,
              elevationLista: elevationLista,
              debounce: debounce,
              onSelected: _onSelect,
              showCloseButton: showCloseButton,
              onCloseButton: onCloseButton,
              iconCloseButton: iconCloseButton,
              controller: controller,
              focusNode: focusNode,
              decoration:
                  effectiveDecoration.copyWith(errorText: field.errorText),
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              style: style,
              strutStyle: strutStyle,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textDirection: textDirection,
              readOnly: readOnly,
              toolbarOptions: toolbarOptions,
              showCursor: showCursor,
              autofocus: autofocus,
              obscuringCharacter: obscuringCharacter,
              obscureText: obscureText,
              autocorrect: autocorrect,
              smartDashesType: smartDashesType,
              smartQuotesType: smartQuotesType,
              enableSuggestions: enableSuggestions,
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              maxLength: maxLength,
              maxLengthEnforcement: maxLengthEnforcement,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onSubmitted: onSubmitted,
              onAppPrivateCommand: onAppPrivateCommand,
              inputFormatters: inputFormatters,
              enabled: enabled,
              cursorWidth: cursorWidth,
              cursorHeight: cursorHeight,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor,
              selectionHeightStyle: selectionHeightStyle,
              selectionWidthStyle: selectionWidthStyle,
              keyboardAppearance: keyboardAppearance,
              scrollPadding: scrollPadding,
              dragStartBehavior: dragStartBehavior,
              enableInteractiveSelection: enableInteractiveSelection,
              selectionControls: selectionControls,
              onTap: onTap,
              mouseCursor: mouseCursor,
              scrollController: scrollController,
              scrollPhysics: scrollPhysics,
              autofillHints: autofillHints,
              clipBehavior: clipBehavior,
              restorationId: restorationId,
              scribbleEnabled: scribbleEnabled,
              enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
              alignmentLista: alignmentLista,
              paddingLista: paddingLista,
              colorLista: colorLista,
              decorationLista: decorationLista,
              foregroundDecorationLista: foregroundDecorationLista,
              widthLista: widthLista,
              heightLista: heightLista,
              constraintsLista: constraintsLista,
              marginLista: marginLista,
              transformLista: transformLista,
              transformAlignmentLista: transformAlignmentLista,
              clipBehaviorLista: clipBehaviorLista,
            );
          },
        );

  final TextEditingController? controller;
  final List<SelectItem<T>> items;

  @override
  FormFieldState<T> createState() => _SelectFormFieldState<T>();
}

class _SelectFormFieldState<T> extends FormFieldState<T> {
  RestorableTextEditingController? _controller;
  TextEditingController get _effectiveController =>
      _textFormField.controller ?? _controller!.value;
  SelectFormField<T> get _textFormField => super.widget as SelectFormField<T>;
  List<SelectItem<T>>? _data;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_getValue(_effectiveController.text));
  }

  @override
  void setValue(T? value) {
    var mydata = _data?.where((element) => element.value == value);
    _effectiveController.text = mydata?.first.search ?? "";
    super.setValue(value);
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: _getSearch(widget.initialValue) ?? "")
          : null);
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(SelectFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_getValue(_textFormField.controller!.text));
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    var aux = _getSearch(value) ?? "";
    if (_effectiveController.text != aux) {
      _effectiveController.text = aux;
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = _getSearch(widget.initialValue) ?? "";
    super.reset();
  }

  void setItems(List<SelectItem<T>> val) {
    _data = val;
  }

  T? _getValue(String val) {
    var mydata = _data?.where((element) => element.search == val);
    if (mydata?.isNotEmpty ?? false) {
      return mydata?.first.value;
    }
    return null;
  }

  String? _getSearch(T? val) {
    var mydata = _data?.where((element) => element.value == val);
    if (mydata?.isNotEmpty ?? false) {
      return mydata?.first.search ?? "";
    }
    return null;
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      var res = _getValue(_effectiveController.text);
      didChange(res);
    }
  }
}
