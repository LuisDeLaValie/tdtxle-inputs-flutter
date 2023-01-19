// ignore_for_file: overridden_fields

part of 'select_imput.dart';

/// Widget principal del buscador
class Search<T> extends StatefulWidget {
  final ValueNotifier<List<SelectItem<T>>> values;
  final TextField textFiled;
  final myCOntainer cuerpo;
  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final void Function(bool stats)? isOpen;
  final Widget? iconCloseButton;
  final double elevation;

  const Search({
    Key? key,
    required this.values,
    required this.textFiled,
    required this.cuerpo,
    this.showCloseButton,
    this.onCloseButton,
    this.isOpen,
    this.iconCloseButton,
    this.elevation = 0.0,
  }) : super(key: key);

  void taphandle() {
    final state = _SearchState();
    state._listenFilter();
  }

  @override
  State<Search<T>> createState() => _SearchState<T>();
}

class _SearchState<T> extends State<Search<T>> with WidgetsBindingObserver {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // widget.textFiled.focusNode!.addListener(_listenFilter);
  }

  void _listenFilter() {
    final val = widget.textFiled.focusNode?.hasFocus ?? false;
    if (val) {
      _generarOverlay();
    } else {
      if (_overlayEntry?.mounted ?? false) _removerOverlay();
    }
  }

  var _isKeyboardVisible = false;
  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    final f = widget.textFiled.focusNode!.hasFocus;

    if (newValue != _isKeyboardVisible) {
      _isKeyboardVisible = newValue;

      /* print("Keyboarddd: $_isKeyboardVisible");
      if (newValue && f) {
        print("si");
        _generarOverlay();
      } else {
        print("no");
        if (_overlayEntry?.mounted ?? false) _removerOverlay();
      } */
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.textFiled,
    );
  }

  void _generarOverlay() {
    isOpen = true;
    _overlayEntry = createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
    widget.isOpen?.call(isOpen);
  }

  void _removerOverlay() {
    isOpen = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
    widget.isOpen?.call(isOpen);
  }

  OverlayEntry createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width,
        height: widget.cuerpo.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: widget.elevation,
            child: widget.cuerpo.copyWith(
              child: ValueListenableBuilder(
                  valueListenable: widget.values,
                  builder: (context, List<SelectItem<T>> v, c) {
                    return ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 1),
                        if (widget.showCloseButton ?? false)
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  _removerOverlay();
                                  if (widget.onCloseButton != null) {
                                    widget.onCloseButton!.call();
                                  }
                                },
                                child: widget.iconCloseButton ??
                                    const Icon(Icons.close),
                              )
                            ],
                          ),
                        ...v,
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class myCOntainer extends Container {
  @override
  final AlignmentGeometry? alignment;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final Color? color;
  @override
  final Decoration? decoration;
  @override
  final Decoration? foregroundDecoration;

  final double? width;

  final double? height;
  @override
  final BoxConstraints? constraints;
  @override
  final EdgeInsetsGeometry? margin;
  @override
  final Matrix4? transform;
  @override
  final AlignmentGeometry? transformAlignment;
  @override
  final Clip clipBehavior;

  myCOntainer({
    super.key,
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

  myCOntainer._({
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
    Widget? child,
  }) : super(
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
          child: child,
        );

  myCOntainer copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    Widget? child,
  }) {
    return myCOntainer._(
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
      child: child ?? this.child,
    );
  }
}
