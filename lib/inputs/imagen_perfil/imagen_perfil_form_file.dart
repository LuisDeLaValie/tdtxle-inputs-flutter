part of 'imagen_perfil.dart';

class ImagenPerfilFormFile extends FormField<String> {
  @override
  // ignore: overridden_fields
  final String? initialValue;
  @override
  // ignore: overridden_fields
  final FormFieldSetter<String>? onSaved;
  @override
  // ignore: overridden_fields
  final FormFieldValidator<String>? validator;

  final Function(String?)? onChanged;
  final Widget? child;
  final double? width;
  final double? height;
  final TypePicker? typePicker;
  final double elevation;
  final BorderRadius borderRadius;

  ImagenPerfilFormFile({
    Key? key,
    this.initialValue,
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
            initialValue: initialValue,
            // autovalidate: autovalidate,

            builder: (FormFieldState<String> state) {
              return InkWell(
                onTap: () async {
                  String? path;

                  switch (typePicker!) {
                    case TypePicker.camara:
                      path = (await SelcetImagen.cameraImage())?.path;
                      break;
                    case TypePicker.galeria:
                      path = (await SelcetImagen.getImageLibrary())?.path;
                      break;
                    case TypePicker.seleccionar:
                      path = (await SelcetImagen.selectCamera(
                              contex: state.context))
                          ?.path;
                      break;
                  }

                  if (path != null) {
                    if (onChanged != null) {
                      onChanged(path);
                    }
                    state.didChange(path);
                  }
                },
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      ImagenPerfilWidget(
                        imgPath: state.value ?? "",
                        elevation: elevation,
                        color: state.hasError
                            ? Colors.red[900]
                            : Colors.white.withOpacity(0.001),
                        borderRadius: borderRadius,
                        width: width,
                        height: height,
                        child: child,
                      ),
                      state.hasError
                          ? Text(
                              state.errorText!,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.red[900]),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            });
}
