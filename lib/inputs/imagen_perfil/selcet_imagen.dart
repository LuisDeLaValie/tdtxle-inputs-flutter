part of 'imagen_perfil.dart';

class SelcetImagen {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> getImageLibrary() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> cameraImage() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
    );
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
