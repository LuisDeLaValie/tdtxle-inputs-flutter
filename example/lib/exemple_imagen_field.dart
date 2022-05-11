import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

class ExempleImagenField extends StatelessWidget {
  const ExempleImagenField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen Field'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImagenPerfil(
              elevation: 2,
              imgPath:
                  "https://i.pinimg.com/originals/76/29/6b/76296bce27e1117092f4bb1411f1d94e.png",
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 120),
            ImageFormField(
              elevation: 2,
              borderRadius: BorderRadius.circular(50),
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            const Text("Seleccione una imagen"),
          ],
        ),
      ),
    );
  }
}
