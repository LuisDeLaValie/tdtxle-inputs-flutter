import 'package:flutter/material.dart';

class SelectImput extends StatefulWidget {
  const SelectImput({Key? key}) : super(key: key);

  @override
  State<SelectImput> createState() => _SelectImputState();
}

class _SelectImputState extends State<SelectImput> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
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
              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      title: Text('Syria'),
                    ),
                    ListTile(
                      title: Text('Lebanon'),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      decoration: const InputDecoration(labelText: 'Country'),
    );
  }
}
