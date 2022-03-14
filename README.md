# TDTxLE_Inputs_Flutter


<details>
  <summary>InputIMG</summary>
  
  ### *ImagenPerfil*
  This Widget shows only an image, the *imgPath* field accepts either a url or a file address

```dart
  ImagenPerfil(
      elevation: double , // required
      borderRadius: BorderRadius.zero,,
      color: Color:
      child: Widget,
      imgPath: String,
      height: double,
      width: double,
    )
```

### SubuirFotos
The *SubuirFotos* class has the functions to choose how to upload the images.

- `getImageLibrary`:
  Directly open the phone gallery to be able to choose an image
- `cameraImage`:
  Directly open the phone camera to take the picture
- `selectCamera`:
  Open a modal so that the user can choose if the image is taken by the camera or from the gallery
  
  
### ImageFormField
The Widget *ImageFormField* is a FormField, to be able to validate from the form when the user adds an image.
```dart
ImageFormField(
  initialValue: String,
  onSaved: void Function(String? newValue),
  validator: String? Function(String? value),
  onChanged: Function(String? value),
  child: Widget,
  width: double,
  height: double,
  typePicker: TypePicker,
  elevation: double,
  borderRadius: BorderRadius,
)
```

</details>
<details>
  <summary>InputChip</summary>

  
</details>


## Use

Dependency with the specific **branch**:
```yaml
dependencies:
  flutter:
    sdk: flutter

  tdtxle_inputs_flutter:
    git:
      url: git://github.com/LuisDeLaValie/tdtxle_inputs_flutter.git
      ref: master # branch name

```

Dependency with the specific **commit**:
```yaml
dependencies:
  flutter:
    sdk: flutter

  tdtxle_inputs_flutter:
    git:
      url: git://github.com/LuisDeLaValie/tdtxle_inputs_flutter.git
      ref: 1172b2f # commit hash
```
