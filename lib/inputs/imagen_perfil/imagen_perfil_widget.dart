part of 'imagen_perfil.dart';

class ImagenPerfilWidget extends StatelessWidget {
  final String imgPath;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Color? color;
  final Widget? child;
  final double? height;
  final double? width;

  const ImagenPerfilWidget({
    Key? key,
    required this.imgPath,
    this.elevation,
    this.borderRadius,
    this.color,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? elcolor = Colors.white.withOpacity(0.001);
    Widget imgen = _error();

    if (color != null) elcolor = color;

    if (imgPath.isNotEmpty) {
      var isweb = imgPath.contains("http");
      if (isweb) {
        imgen = _imagenUrl(imgPath);
      } else {
        imgen = _imagenFile(File(imgPath));
      }
    }

    return Material(
      elevation: elevation ?? 0.0,
      borderRadius: borderRadius,
      color: elcolor,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: imgen,
      ),
    );
  }

  Widget _error() {
    if (child != null) {
      return child!;
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: const Icon(Icons.person),
      );
    }
  }

  Widget _imagenUrl(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (_, c, s) => _error(),
      loadingBuilder: (_, w, s) {
        return s != null
            ? SizedBox(
                height: height,
                width: width,
                child: const Center(child: CircularProgressIndicator()),
              )
            : w;
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
