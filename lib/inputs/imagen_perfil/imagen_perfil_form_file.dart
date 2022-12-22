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
    Key? key,
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
            key: key,
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

                  /* child: SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        ImagenPerfilWidget(
                          imgPath: state.value?.path ?? "",
                          elevation: elevation,
                          color: state.hasError
                              ? const InputDecoration().errorStyle?.color
                              : Colors.white.withOpacity(0.001),
                          borderRadius: borderRadius,
                          width: width,
                          height: height,
                          child: child,
                        ),
                        state.hasError
                            ? Text(
                                state.errorText!,
                                style: const InputDecoration().errorStyle,
                              )
                            : Container()
                      ],
                    ),
                  ), */
                ),
              );
            });
  @override
  FormFieldState<ImagenPerfil> createState() => _ImagenPerfilFormFileState();
}

class _ImagenPerfilFormFileState extends FormFieldState<ImagenPerfil> {
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      var isweb = widget.initialValue!.path.contains("http");
      if (isweb) {
        setValue(ImagenPerfilWeb(path: widget.initialValue!.path));
      } else {
        setValue(ImagenPerfilWeb(path: widget.initialValue!.path));
      }
    }
  }
}
