part of 'select_imput.dart';

/// Widget principal del buscador
class Search<T> extends StatefulWidget {
  final ValueNotifier<List<SelectItem<T>>> values;
  final FieldSettings? settingsTextField;
  final SelectListSettings? settingsList;
  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final void Function(bool stats)? isOpen;
  final Widget? iconCloseButton;

  const Search({
    Key? key,
    required this.values,
    this.settingsTextField,
    this.settingsList,
    this.showCloseButton,
    this.onCloseButton,
    this.iconCloseButton,
    this.isOpen,
  }) : super(key: key);

  @override
  State<Search<T>> createState() => _SearchState<T>();
}

class _SearchState<T> extends State<Search<T>> {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;

  late FieldSettings _settingsTextField;
  late SelectListSettings _settingsList;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    FieldSettings aux = widget.settingsTextField ?? const SelectFieldSettings();
    _settingsList = widget.settingsList ?? SelectListSettings();

    if (aux is SelectFieldSettings) {
      _focusNode = aux.focusNode ?? FocusNode();
    } else if (aux is SelectFormFieldSettings) {
      _focusNode = aux.focusNode ?? FocusNode();
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
        widget.isOpen?.call(true);
      } else {
        if (_overlayEntry.mounted) {
          _overlayEntry.remove();
          widget.isOpen?.call(false);
        }
      }
    });

    if (aux is SelectFieldSettings) {
      _settingsTextField = aux.copyWith(
        focusNode: _focusNode,
        onTap: () {
          if (_focusNode.hasFocus && !_overlayEntry.mounted) {
            _overlayEntry = createOverlayEntry();
            Overlay.of(context)!.insert(_overlayEntry);
            widget.isOpen?.call(true);
          }
        },
      );
    } else if (aux is SelectFormFieldSettings) {
      _settingsTextField = aux.copyWith(
        focusNode: _focusNode,
        onTap: () {
          if (_focusNode.hasFocus && !_overlayEntry.mounted) {
            _overlayEntry = createOverlayEntry();
            Overlay.of(context)!.insert(_overlayEntry);
            widget.isOpen?.call(true);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_settingsTextField is SelectFieldSettings) {
      return CompositedTransformTarget(
        link: _layerLink,
        child: _settingsTextField as SelectFieldSettings,
      );
    } else {
      return CompositedTransformTarget(
        link: _layerLink,
        child: _settingsTextField as SelectFormFieldSettings,
      );
    }
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
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: _settingsList.elevation,
            child: _settingsList.copyWith(
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
                                  _overlayEntry.remove();
                                  widget.isOpen?.call(false);
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
