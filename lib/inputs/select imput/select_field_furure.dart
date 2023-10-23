part of 'select_imput.dart';

/// Widget para combertir el [Search] en un Field widget
class SelectFieldFuture<T> extends StatefulWidget {
  final Future<List<SelectItem<T>>> Function(String search) values;
  final List<SelectItem<T>>? loading;
  final FieldSettings? settingsTextField;
  final SelectListSettings? settingsList;
  final void Function(T)? onSelected;

  /// time on miliseconds to wait before search
  final int debounce;

  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final Widget? iconCloseButton;

  const SelectFieldFuture({
    super.key,
    required this.values,
    this.loading,
    this.settingsTextField,
    this.settingsList,
    this.onSelected,
    this.debounce = 500,
    this.showCloseButton,
    this.onCloseButton,
    this.iconCloseButton,
  });

  @override
  State<SelectFieldFuture<T>> createState() => _SelectFieldFutureState<T>();
}

class _SelectFieldFutureState<T> extends State<SelectFieldFuture<T>> {
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

    _controller.addListener(() {
      if (isOpen) {
        _values.value = widget.loading ?? [];
        debounce(() {
          widget.values(_controller.text).then((v) {
            var aux = v.map(
              (element) => element.copyWith(
                onTap: () {
                  setState(() => isOpen = false);
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

            _values.value = aux.toList();
          });
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
