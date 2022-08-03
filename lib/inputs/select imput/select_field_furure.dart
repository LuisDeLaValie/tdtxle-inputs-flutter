part of 'select_imput.dart';

/// Widget para combertir el [Search] en un Field widget
class SelectFieldFuture<T> extends StatefulWidget {
  final Future<List<SelectItem<T>>> Function(String search) values;
  final SelectFieldSettings? settingsTextField;
  final SelectListSettings? settingsList;
  final void Function(T)? onSelected;

  /// time on miliseconds to wait before search
  final int debounce;

  final bool? showCloseButton;
  final void Function()? onCloseButton;
  final Widget? iconCloseButton;

  const SelectFieldFuture({
    Key? key,
    required this.values,
    this.settingsTextField,
    this.settingsList,
    this.onSelected,
    this.debounce = 500,
    this.showCloseButton,
    this.onCloseButton,
    this.iconCloseButton,
  }) : super(key: key);

  @override
  State<SelectFieldFuture<T>> createState() => _SelectFieldFutureState<T>();
}

class _SelectFieldFutureState<T> extends State<SelectFieldFuture<T>> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  late SelectFieldSettings _settingsTextField;
  late SelectListSettings _settingsList;
  final ValueNotifier<List<SelectItem<dynamic>>> _values =
      ValueNotifier<List<SelectItem<dynamic>>>([]);

  Timer? _debounce;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    var auxfield = widget.settingsTextField ?? const SelectFieldSettings();
    var auxlist = widget.settingsList ?? SelectListSettings();

    _focusNode = auxfield.focusNode ?? FocusNode();
    _controller = auxfield.controller ?? TextEditingController();

    _controller.addListener(() {
      if (isOpen) {
        debounce(() {
          widget.values(_controller.text).then((v) {
            var aux = v.map(
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

            _values.value = aux.toList();
          });
        });
      }
    });

    _settingsList = auxlist;

    _settingsTextField = auxfield.copyWith(
      focusNode: _focusNode,
      controller: _controller,
    );
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
    _debounce = Timer(const Duration(milliseconds: 500), callback);
  }
}
