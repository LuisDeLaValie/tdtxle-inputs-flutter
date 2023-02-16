import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

class ExempleImagenField extends StatefulWidget {
  const ExempleImagenField({Key? key}) : super(key: key);

  @override
  State<ExempleImagenField> createState() => _ExempleImagenFieldState();
}

class _ExempleImagenFieldState extends State<ExempleImagenField> {
  final _formKey = GlobalKey<FormState>();

  String imagen =
      "/data/user/0/com.example.example/cache/scaled_image_picker889335626320001075.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen Field'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImagenPerfilFormFile(
                initialValue: imagen,
                width: 150,
                height: 150,
                borderRadius: BorderRadius.circular(100),
                validator: ((value) {
                  print(value);
                  imagen =
                      "/data/user/0/com.example.example/cache/imagenPrueba.jpg";
                  (value as ImagenPerfilFile).mover(newPath: imagen);

                  setState(() {});
                  return "asdasddasdasd adsa sdas das";
                }),
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  _formKey.currentState!.save();
                },
                child: const Text("VAlidar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
