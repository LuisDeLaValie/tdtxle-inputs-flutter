import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'select_item.dart';
part 'selec_list_settings.dart';

class MenuDesplegableTextFiles<T> extends StatefulWidget {
  final ValueListenable<List<SelectItemBase<T>>> values;
  final Widget widget;
  final SelectListSettings? settingsList;
  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final void Function(bool stats)? isOpen;
  final Widget? iconCloseButton;
  final MenuDesplegableController<T>? controller;
  const MenuDesplegableTextFiles({
    super.key,
    required this.values,
    required this.widget,
    this.settingsList,
    this.showCloseButton,
    this.onCloseButton,
    this.isOpen,
    this.iconCloseButton,
    this.controller,
  });

  @override
  MenuDesplegableTextFilesState<T> createState() =>
      MenuDesplegableTextFilesState<T>();
}

class MenuDesplegableTextFilesState<T>
    extends State<MenuDesplegableTextFiles<T>> {
  late SelectListSettings _settingsList;

  late MenuDesplegableController<T> _controller;

  @override
  void initState() {
    _settingsList = widget.settingsList ?? SelectListSettings();

    _controller = widget.controller ?? MenuDesplegableController<T>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.overlayEntry = _createOverlayEntry();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.context = context;
    return CompositedTransformTarget(
      link: _controller.layerLink,
      child: widget.widget,
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width,
        child: CompositedTransformFollower(
          link: _controller.layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: _settingsList.elevation,
            child: _settingsList.copyWith(
              child: ValueListenableBuilder(
                  valueListenable: widget.values,
                  builder: (context, v, c) {
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
                                  _controller.close();
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

class MenuDesplegableController<T> {
  final ValueNotifier<_DatosMenuDesplegableController<T>> _value =
      ValueNotifier<_DatosMenuDesplegableController<T>>(
          _DatosMenuDesplegableController<T>());

  late OverlayEntry _overlayEntry;
  OverlayEntry get overlayEntry => _value.value.overlayEntry;
  set overlayEntry(OverlayEntry val) => _value.value.overlayEntry = val;

  LayerLink get layerLink => _value.value.layerLink;


  late BuildContext context;

  void open() {
    _overlayEntry = overlayEntry;
    Overlay.of(context).insert(_overlayEntry);
  }

  void close() {
    _overlayEntry.remove();
  }
}

class _DatosMenuDesplegableController<T> {
  final LayerLink layerLink = LayerLink();
  late OverlayEntry overlayEntry;
  late BuildContext context;
}
