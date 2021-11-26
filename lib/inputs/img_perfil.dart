import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagenPerfil extends StatelessWidget {
  final double elevation;
  final BorderRadius? borderRadius;
  final Color? color;
  final Widget? child;
  final String? url;
  final File? fileImage;
  final double? height;
  final double? width;

  const ImagenPerfil({
    Key? key,
    required this.elevation,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.url,
    this.fileImage,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? elcolor = Colors.white.withOpacity(0.001);
    if (color != null) elcolor = color;

    Widget imgen = _error();
    if (url != null && fileImage != null) {
      imgen = _error();
    } else if (url != null) {
      imgen = _imagenUrl(url!);
    } else if (fileImage != null) {
      imgen = _imagenFile(fileImage!);
    } else {
      imgen = _error();
    }

    return Material(
      elevation: elevation,
      borderRadius: borderRadius,
      color: elcolor,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: imgen,
      ),
    );
  }

  Widget _error() => (child != null)
      ? child!
      : SizedBox(
          height: height,
          width: width,
          child: const Icon(Icons.person),
        );

  Widget _imagenUrl(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (_, c, s) => _error(),
      loadingBuilder: (_, w, s) {
        return s != null ? const Center(child: CircularProgressIndicator()) : w;
      },
    );
  }

  Widget _imagenFile(File file) {
    return Image.file(
      file,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (_, c, s) => _error(),
    );
  }
}

class ImageFormField extends FormField<String> {
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
  
  final BuildContext contex;
  final Widget? child;
  final double? width;
  final double? height;

  final double elevation;
  final BorderRadius borderRadius;

  ImageFormField(
      {Key? key,
      this.onSaved,
      this.validator,
      this.child,
      this.width,
      this.height,
      required this.contex,
      this.initialValue,
      this.borderRadius = BorderRadius.zero,
      this.onChanged,
      this.elevation = 0})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            // autovalidate: autovalidate,

            builder: (FormFieldState<String> state) {
              String? url;
              File? file;
              if ((state.value?.split("://").length ?? 0) > 1) {
                url = state.value!;
              } else {
                file = File(state.value!);
              }

              return InkWell(
                onTap: () {
                  SubuirFotos.selectCamera(contex: contex).then((value) {
                    if (onChanged != null) {
                      onChanged(value!.path);
                    }
                    state.didChange(value!.path);
                  });
                },
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      ImagenPerfil(
                        elevation: elevation,
                        color: state.hasError
                            ? Colors.red[900]
                            : Colors.white.withOpacity(0.001),
                        borderRadius: borderRadius,
                        url: url,
                        fileImage: file,
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

class SubuirFotos {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> getImageLibrary() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 1024, maxHeight: 1024);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> cameraImage() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 1024, maxHeight: 1024);
    if (photo != null) {
      return File(photo.path);
    } else {
      return null;
    }
  }

  static Future<File?> selectCamera({required BuildContext contex}) {
    return showCupertinoModalPopup<File?>(
      context: contex,
      builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('Seleccionar Imagen'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Camara'),
              onPressed: () async {
                final file = await cameraImage();
                Navigator.pop(context, file);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Galería'),
              onPressed: () async {
                final file = await getImageLibrary();
                Navigator.pop(context, file);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, null);
            },
          )),
    );
  }
}
