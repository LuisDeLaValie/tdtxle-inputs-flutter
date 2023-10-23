part of 'select_imput.dart';

/// Widget para combertir el [Search] en un Field widget
class SelectField<T> extends StatefulWidget {
  final List<SelectItem<T>> values;
  final FieldSettings? settingsTextField;
  final SelectListSettings? settingsList;
  final void Function(T)? onSelected;

  /// time on miliseconds to wait before search
  final int debounce;

  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final Widget? iconCloseButton;

  const SelectField({
    super.key,
    required this.values,
    this.settingsTextField,
    this.settingsList,
    this.onSelected,
    this.debounce = 500,
    this.showCloseButton,
    this.onCloseButton,
    this.iconCloseButton,
  });

  @override
  State<SelectField<T>> createState() => _SelectFieldState<T>();
}

class _SelectFieldState<T> extends State<SelectField<T>> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  late FieldSettings _settingsTextField;
  late SelectListSettings _settingsList;
  final ValueNotifier<List<SelectItem<dynamic>>> _values =
      ValueNotifier<List<SelectItem<dynamic>>>([]);

  Timer? _debounce;

  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    FieldSettings auxfield =
        widget.settingsTextField ?? const SelectFieldSettings();
    var auxlist = widget.settingsList ?? SelectListSettings();

    if (auxfield is SelectFieldSettings) {
      _focusNode = auxfield.focusNode ?? FocusNode();
      _controller = auxfield.controller ?? TextEditingController();
    } else if (auxfield is SelectFormFieldSettings) {
      _focusNode = auxfield.focusNode ?? FocusNode();
      _controller = auxfield.controller ?? TextEditingController();
    }
    _values.value = widget.values;

    _controller.addListener(() {
      if (isOpen) {
        debounce(() {
          var aux = widget.values.map(
            (element) => element.copyWith(
              onTap: () {
                if (widget.onSelected != null) {
                  widget.onSelected!(element.value);
                }
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {
                  _controller.text = element.search;
                });
                element.onTap?.call();
              },
            ),
          );

          if (_controller.text.isNotEmpty) {
            _values.value = aux
                .where((e) => e.search
                    .toLowerCase()
                    .contains(_controller.text.toLowerCase()))
                .toList();
          } else {
            _values.value = aux.toList();
          }
        });
      }
    });

    _settingsList = auxlist;

    if (auxfield is SelectFieldSettings) {
      _settingsTextField = auxfield.copyWith(
        focusNode: _focusNode,
        controller: _controller,
      );
    } else if (auxfield is SelectFormFieldSettings) {
      _settingsTextField = auxfield.copyWith(
        focusNode: _focusNode,
        controller: _controller,
      );
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _values.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Search(
      values: _values,
      settingsTextField: _settingsTextField,
      settingsList: _settingsList,
      showCloseButton: widget.showCloseButton,
      onCloseButton: widget.onCloseButton,
      iconCloseButton: widget.iconCloseButton,
      isOpen: (val) {
        setState(() => isOpen = val);
        _controller.text = _controller.text;
      },
    );
  }

  /// metodo que vita que se sobre carge para evitar que se ejecute varias veces
  void debounce(void Function() callback) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(Duration(milliseconds: widget.debounce), callback);
  }
}
