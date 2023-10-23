part of 'imagen_perfil.dart';

class ImagenPerfilFormFile extends FormField<ImagenPerfil> {
  @override
  // ignore: overridden_fields
  final FormFieldSetter<ImagenPerfil>? onSaved;
  @override
  // ignore: overridden_fields
  final FormFieldValidator<ImagenPerfil>? validator;

  final Function(ImagenPerfil?)? onChanged;
  final Widget? child;
  final double? width;
  final double? height;
  final TypePicker? typePicker;
  final double elevation;
  final BorderRadius borderRadius;

  ImagenPerfilFormFile({
    super.key,
    String? initialValue,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.child,
    this.width,
    this.height,
    this.typePicker = TypePicker.seleccionar,
    this.elevation = 0,
    this.borderRadius = BorderRadius.zero,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: (initialValue != null)
                ? ImagenPerfil(path: initialValue)
                : null,
            // autovalidate: autovalidate,

            builder: (FormFieldState<ImagenPerfil> field) {
              final _ImagenPerfilFormFileState state =
                  field as _ImagenPerfilFormFileState;

              final InputDecoration effectiveDecoration =
                  const InputDecoration()
                      .applyDefaults(
                        Theme.of(state.context).inputDecorationTheme,
                      )
                      .copyWith(
                        contentPadding: const EdgeInsets.all(0),
                        border: OutlineInputBorder(borderRadius: borderRadius),
                        errorText: state.errorText,
                      );

              return SizedBox(
                width: width,
                height: height,
                child: InkWell(
                  onTap: () async {
                    ImagenPerfil? imagen;

                    switch (typePicker!) {
                      case TypePicker.camara:
                        var path = (await SelcetImagen.cameraImage())?.path;
                        if (path != null) imagen = ImagenPerfilWeb(path: path);
                        break;
                      case TypePicker.galeria:
                        var path = (await SelcetImagen.getImageLibrary())?.path;
                        if (path != null) imagen = ImagenPerfilFile(path: path);
                        break;
                      case TypePicker.seleccionar:
                        // ignore: use_build_context_synchronously
                        var path = (await SelcetImagen.selectCamera(
                                contex: state.context))
                            ?.path;
                        if (path != null) imagen = ImagenPerfilFile(path: path);
                        break;
                    }

                    if (imagen != null) {
                      if (onChanged != null) {
                        onChanged(imagen);
                      }
                      state.didChange(imagen);
                    }
                  },
                  child: InputDecorator(
                    decoration: effectiveDecoration,
                    child: ImagenPerfilWidget(
                      imgPath: state.value?.path ?? "",
                      // elevation: elevation,
                      borderRadius: borderRadius,
                      width: width,
                      height: height,
                      child: child,
                    ),
                  ),
                ),
              );
            });
  @override
  FormFieldState<ImagenPerfil> createState() => _ImagenPerfilFormFileState();
}

class _ImagenPerfilFormFileState extends FormFieldState<ImagenPerfil> {
  @override
  void didUpdateWidget(FormField<ImagenPerfil> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _datos();
  }

  @override
  void initState() {
    super.initState();
    _datos();
  }

  void _datos() {
    if (widget.initialValue != null) {
      var isweb = RegExp(r"https*://").hasMatch(widget.initialValue!.path);

      if (isweb) {
        setValue(ImagenPerfilWeb(path: widget.initialValue!.path));
      } else {
        setValue(ImagenPerfilFile(path: widget.initialValue!.path));
      }
    }
  }
}
