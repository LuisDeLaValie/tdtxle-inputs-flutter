import 'package:flutter/material.dart';
import 'package:tdtxle_inputs_flutter/inputs_tdtxle.dart';

class ExempleImagenField extends StatefulWidget {
  const ExempleImagenField({Key? key}) : super(key: key);

  @override
  State<ExempleImagenField> createState() => _ExempleImagenFieldState();
}

class _ExempleImagenFieldState extends State<ExempleImagenField> {
  final _formKey = GlobalKey<FormState>();
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
              // ImagenPerfilWidget(
              //   elevation: 2,
              //   imgPath:
              //       "https://i.pinimg.com/originals/76/29/6b/76296bce27e1117092f4bb1411f1d94e.png",
              //   borderRadius: BorderRadius.circular(50),
              //   color: Colors.white,
              //   width: 150,
              //   height: 150,
              // ),
              // const SizedBox(height: 120),
              // TextFormField()
              ImagenPerfilFormFile(
                initialValue:
                    "https://i.pinimg.com/originals/76/29/6b/76296bce27e1117092f4bb1411f1d94e.png",
                width: 150,
                height: 150,
                borderRadius: BorderRadius.circular(100),
                validator: (value) {
                  // return "asdasddasdasd adsa sdas das";
                  return null;
                },
                onSaved: (val) {
                  if (val is ImagenPerfilWeb) {
                    val.dowloader("path");
                  }
                },
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
