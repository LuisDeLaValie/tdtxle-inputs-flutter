part of 'select_imput.dart';

/// Estilo para el imput del buscardor
class FieldSettings {}

class SelectFieldSettings extends TextField implements FieldSettings {
  @override
  final TextEditingController? controller;

  @override
  final FocusNode? focusNode;

  @override
  final InputDecoration? decoration;

  @override
  final TextInputType keyboardType;

  @override
  final TextInputAction? textInputAction;

  @override
  final TextCapitalization textCapitalization;

  @override
  final TextStyle? style;

  @override
  final StrutStyle? strutStyle;

  @override
  final TextAlign textAlign;

  @override
  final TextAlignVertical? textAlignVertical;

  @override
  final TextDirection? textDirection;

  @override
  final bool autofocus;

  @override
  final String obscuringCharacter;

  @override
  final bool obscureText;

  @override
  final bool autocorrect;

  @override
  final SmartDashesType smartDashesType;

  @override
  final SmartQuotesType smartQuotesType;

  @override
  final bool enableSuggestions;

  @override
  final int? maxLines;

  @override
  final int? minLines;

  @override
  final bool expands;

  @override
  final bool readOnly;

  @override
  final ToolbarOptions toolbarOptions;

  @override
  final bool? showCursor;

  static const int noMaxLength = -1;

  @override
  final int? maxLength;

  @override
  final MaxLengthEnforcement? maxLengthEnforcement;

  @override
  final ValueChanged<String>? onChanged;

  @override
  final VoidCallback? onEditingComplete;

  @override
  final ValueChanged<String>? onSubmitted;

  @override
  final AppPrivateCommandCallback? onAppPrivateCommand;

  @override
  final List<TextInputFormatter>? inputFormatters;

  @override
  final bool? enabled;

  @override
  final double cursorWidth;

  @override
  final double? cursorHeight;

  @override
  final Radius? cursorRadius;

  @override
  final Color? cursorColor;

  @override
  final ui.BoxHeightStyle selectionHeightStyle;

  @override
  final ui.BoxWidthStyle selectionWidthStyle;

  @override
  final Brightness? keyboardAppearance;

  @override
  final EdgeInsets scrollPadding;

  @override
  final bool enableInteractiveSelection;

  @override
  final TextSelectionControls? selectionControls;

  @override
  final DragStartBehavior dragStartBehavior;

  @override
  bool get selectionEnabled => enableInteractiveSelection;

  @override
  final GestureTapCallback? onTap;

  @override
  final MouseCursor? mouseCursor;
  @override
  final InputCounterWidgetBuilder? buildCounter;

  @override
  final ScrollPhysics? scrollPhysics;

  @override
  final ScrollController? scrollController;

  @override
  final Iterable<String>? autofillHints;

  @override
  final Clip clipBehavior;

  @override
  final String? restorationId;

  @override
  final bool enableIMEPersonalizedLearning;
  // ignore: use_key_in_widget_constructors
  const SelectFieldSettings({
    Key? key,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    ToolbarOptions? toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
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
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
  })  : smartDashesType = smartDashesType ??
            (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ??
            (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        toolbarOptions = toolbarOptions ??
            (obscureText
                ? const ToolbarOptions(
                    selectAll: true,
                    paste: true,
                  )
                : const ToolbarOptions(
                    copy: true,
                    cut: true,
                    selectAll: true,
                    paste: true,
                  )),
        super(
          controller: controller,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
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
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
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
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          dragStartBehavior: dragStartBehavior,
          onTap: onTap,
          mouseCursor: mouseCursor,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          scrollController: scrollController,
          autofillHints: autofillHints,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        );

  SelectFieldSettings copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? autofocus,
    String? obscuringCharacter,
    bool? obscureText,
    bool? autocorrect,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    bool? readOnly,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    int? maxLength,
    MaxLengthEnforcement? maxLengthEnforcement,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    AppPrivateCommandCallback? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    ui.BoxHeightStyle? selectionHeightStyle,
    ui.BoxWidthStyle? selectionWidthStyle,
    Brightness? keyboardAppearance,
    EdgeInsets? scrollPadding,
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    DragStartBehavior? dragStartBehavior,
    GestureTapCallback? onTap,
    MouseCursor? mouseCursor,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    Iterable<String>? autofillHints,
    Clip? clipBehavior,
    String? restorationId,
    bool? enableIMEPersonalizedLearning,
  }) {
    return SelectFieldSettings(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      decoration: decoration ?? this.decoration,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      textDirection: textDirection ?? this.textDirection,
      autofocus: autofocus ?? this.autofocus,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      obscureText: obscureText ?? this.obscureText,
      autocorrect: autocorrect ?? this.autocorrect,
      smartDashesType: smartDashesType ?? this.smartDashesType,
      smartQuotesType: smartQuotesType ?? this.smartQuotesType,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      maxLines: maxLines ?? this.maxLines,
      minLines: minLines ?? this.minLines,
      expands: expands ?? this.expands,
      readOnly: readOnly ?? this.readOnly,
      toolbarOptions: toolbarOptions ?? this.toolbarOptions,
      showCursor: showCursor ?? this.showCursor,
      maxLength: maxLength ?? this.maxLength,
      maxLengthEnforcement: maxLengthEnforcement ?? this.maxLengthEnforcement,
      onChanged: onChanged ?? this.onChanged,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand ?? this.onAppPrivateCommand,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      enabled: enabled ?? this.enabled,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorColor: cursorColor ?? this.cursorColor,
      selectionHeightStyle: selectionHeightStyle ?? this.selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle ?? this.selectionWidthStyle,
      keyboardAppearance: keyboardAppearance ?? this.keyboardAppearance,
      scrollPadding: scrollPadding ?? this.scrollPadding,
      enableInteractiveSelection:
          enableInteractiveSelection ?? this.enableInteractiveSelection,
      selectionControls: selectionControls ?? this.selectionControls,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      onTap: onTap ?? this.onTap,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      buildCounter: buildCounter ?? this.buildCounter,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      scrollController: scrollController ?? this.scrollController,
      autofillHints: autofillHints ?? this.autofillHints,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      restorationId: restorationId ?? this.restorationId,
      enableIMEPersonalizedLearning:
          enableIMEPersonalizedLearning ?? this.enableIMEPersonalizedLearning,
    );
  }
}

class SelectFormFieldSettings extends TextFormField implements FieldSettings {
  @override
  final TextEditingController? controller;

  @override
  final FocusNode? focusNode;

  @override
  final InputDecoration? decoration;

  @override
  final TextInputType? keyboardType;

  @override
  final TextInputAction? textInputAction;

  @override
  final TextCapitalization textCapitalization;

  @override
  final TextStyle? style;

  @override
  final StrutStyle? strutStyle;

  @override
  final TextAlign textAlign;

  @override
  final TextAlignVertical? textAlignVertical;

  @override
  final TextDirection? textDirection;

  @override
  final bool autofocus;

  @override
  final String obscuringCharacter;

  @override
  final bool obscureText;

  @override
  final bool autocorrect;

  @override
  final SmartDashesType? smartDashesType;

  @override
  final SmartQuotesType? smartQuotesType;

  @override
  final bool enableSuggestions;

  @override
  final int? maxLines;

  @override
  final int? minLines;

  @override
  final bool expands;

  @override
  final bool readOnly;

  @override
  final ToolbarOptions? toolbarOptions;

  @override
  final bool? showCursor;

  static const int noMaxLength = -1;

  @override
  final int? maxLength;

  @override
  final MaxLengthEnforcement? maxLengthEnforcement;

  @override
  final ValueChanged<String>? onChanged;

  @override
  final VoidCallback? onEditingComplete;

  @override
  final ValueChanged<String>? onSubmitted;

  @override
  final AppPrivateCommandCallback? onAppPrivateCommand;

  @override
  final List<TextInputFormatter>? inputFormatters;

  @override
  final double cursorWidth;

  @override
  final double? cursorHeight;

  @override
  final Radius? cursorRadius;

  @override
  final Color? cursorColor;

  @override
  final ui.BoxHeightStyle selectionHeightStyle;

  @override
  final ui.BoxWidthStyle selectionWidthStyle;

  @override
  final Brightness? keyboardAppearance;

  @override
  final EdgeInsets scrollPadding;

  @override
  final bool enableInteractiveSelection;

  @override
  final TextSelectionControls? selectionControls;

  @override
  final DragStartBehavior dragStartBehavior;

  @override
  bool get selectionEnabled => enableInteractiveSelection;

  @override
  final GestureTapCallback? onTap;

  @override
  final MouseCursor? mouseCursor;
  @override
  final InputCounterWidgetBuilder? buildCounter;

  @override
  final ScrollPhysics? scrollPhysics;

  @override
  final ScrollController? scrollController;

  @override
  final Iterable<String>? autofillHints;

  @override
  final Clip clipBehavior;

  @override
  final String? restorationId;

  @override
  final bool enableIMEPersonalizedLearning;

  SelectFormFieldSettings(
      {Key? key,
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
      bool? enabled,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.selectionHeightStyle = ui.BoxHeightStyle.tight,
      this.selectionWidthStyle = ui.BoxWidthStyle.tight,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.dragStartBehavior = DragStartBehavior.start,
      this.enableInteractiveSelection = true,
      this.selectionControls,
      this.onTap,
      this.mouseCursor,
      this.buildCounter,
      this.scrollController,
      this.scrollPhysics,
      this.autofillHints = const <String>[],
      this.clipBehavior = Clip.hardEdge,
      this.restorationId,
      this.enableIMEPersonalizedLearning = true,
      String? initialValue,
      void Function(String)? onFieldSubmitted,
      void Function(String?)? onSaved,
      String? Function(String?)? validator,
      AutovalidateMode? autovalidateMode})
      : super(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          mouseCursor: mouseCursor,
        );

  SelectFormFieldSettings copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? autofocus,
    String? obscuringCharacter,
    bool? obscureText,
    bool? autocorrect,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    bool? readOnly,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    int? maxLength,
    MaxLengthEnforcement? maxLengthEnforcement,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    AppPrivateCommandCallback? onAppPrivateCommand,
    List<TextInputFormatter>? inputFormatters,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    ui.BoxHeightStyle? selectionHeightStyle,
    ui.BoxWidthStyle? selectionWidthStyle,
    Brightness? keyboardAppearance,
    EdgeInsets? scrollPadding,
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    DragStartBehavior? dragStartBehavior,
    GestureTapCallback? onTap,
    MouseCursor? mouseCursor,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    Iterable<String>? autofillHints,
    Clip? clipBehavior,
    String? restorationId,
    bool? enableIMEPersonalizedLearning,
  }) {
    return SelectFormFieldSettings(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      decoration: decoration ?? this.decoration,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      textDirection: textDirection ?? this.textDirection,
      autofocus: autofocus ?? this.autofocus,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      obscureText: obscureText ?? this.obscureText,
      autocorrect: autocorrect ?? this.autocorrect,
      smartDashesType: smartDashesType ?? this.smartDashesType,
      smartQuotesType: smartQuotesType ?? this.smartQuotesType,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      maxLines: maxLines ?? this.maxLines,
      minLines: minLines ?? this.minLines,
      expands: expands ?? this.expands,
      readOnly: readOnly ?? this.readOnly,
      toolbarOptions: toolbarOptions ?? this.toolbarOptions,
      showCursor: showCursor ?? this.showCursor,
      maxLength: maxLength ?? this.maxLength,
      maxLengthEnforcement: maxLengthEnforcement ?? this.maxLengthEnforcement,
      onChanged: onChanged ?? this.onChanged,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand ?? this.onAppPrivateCommand,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorColor: cursorColor ?? this.cursorColor,
      selectionHeightStyle: selectionHeightStyle ?? this.selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle ?? this.selectionWidthStyle,
      keyboardAppearance: keyboardAppearance ?? this.keyboardAppearance,
      scrollPadding: scrollPadding ?? this.scrollPadding,
      enableInteractiveSelection:
          enableInteractiveSelection ?? this.enableInteractiveSelection,
      selectionControls: selectionControls ?? this.selectionControls,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      onTap: onTap ?? this.onTap,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      buildCounter: buildCounter ?? this.buildCounter,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      scrollController: scrollController ?? this.scrollController,
      autofillHints: autofillHints ?? this.autofillHints,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      restorationId: restorationId ?? this.restorationId,
      enableIMEPersonalizedLearning:
          enableIMEPersonalizedLearning ?? this.enableIMEPersonalizedLearning,
    );
  }
}

/// Estilo para la lista dal buscador
class SelectListSettings extends Container {
  SelectListSettings({
    Key? key,
    this.elevation = 0.0,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
  }) : super(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
        );
  final double? width;
  final double? height;
  final double elevation;

  /// Align the [child] within the container.
  ///
  /// If non-null, the container will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  @override
  final AlignmentGeometry? alignment;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  @override
  final EdgeInsetsGeometry? padding;

  /// The color to paint behind the [child].
  ///
  /// This property should be preferred when the background is a simple color.
  /// For other cases, such as gradients or images, use the [decoration]
  /// property.
  ///
  /// If the [decoration] is used, this property must be null. A background
  /// color may still be painted by the [decoration] even if this property is
  /// null.
  @override
  final Color? color;

  /// The decoration to paint behind the [child].
  ///
  /// Use the [color] property to specify a simple solid color.
  ///
  /// The [child] is not clipped to the decoration. To clip a child to the shape
  /// of a particular [ShapeDecoration], consider using a [ClipPath] widget.
  @override
  final Decoration? decoration;

  /// The decoration to paint in front of the [child].
  @override
  final Decoration? foregroundDecoration;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  @override
  final BoxConstraints? constraints;

  /// Empty space to surround the [decoration] and [child].
  @override
  final EdgeInsetsGeometry? margin;

  /// The transformation matrix to apply before painting the container.
  @override
  final Matrix4? transform;

  /// The alignment of the origin, relative to the size of the container, if [transform] is specified.
  ///
  /// When [transform] is null, the value of this property is ignored.
  ///
  /// See also:
  ///
  ///  * [Transform.alignment], which is set by this property.
  @override
  final AlignmentGeometry? transformAlignment;

  /// The clip behavior when [Container.decoration] is not null.
  ///
  /// Defaults to [Clip.none]. Must be [Clip.none] if [decoration] is null.
  ///
  /// If a clip is to be applied, the [Decoration.getClipPath] method
  /// for the provided decoration must return a clip path. (This is not
  /// supported by all decorations; the default implementation of that
  /// method throws an [UnsupportedError].)
  @override
  final Clip clipBehavior;

  Container copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    required Widget child,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
  }) {
    return Container(
      child: child,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      width: width ?? this.width,
      height: height ?? this.height,
      constraints: constraints ?? this.constraints,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}
