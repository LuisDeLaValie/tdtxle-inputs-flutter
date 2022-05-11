# TDTxLE_Inputs_Flutter

TDTxLE_Inputs_Flutter is a bundle of custom input widgets used on a daily basis

<img src="media/img.gif" height="400"><img src="media/chip1.gif" height="400"><img src="media/chip2.gif" height="400"><img src="media/select.gif" height="400">

## Use
---

Dependency with the specific **branch**:
```yaml
dependencies:
  flutter:
    sdk: flutter

 tdtxle_inputs_flutter:
    git:
      url: https://github.com/LuisDeLaValie/tdtxle_inputs_flutter.git
      ref: master # branch name

```

Dependency with the specific **commit**:
```yaml
dependencies:
  flutter:
    sdk: flutter

  tdtxle_inputs_flutter:
    git:
      url: https://github.com/LuisDeLaValie/tdtxle_inputs_flutter.git
      ref: 392fe22 # commit hash
```



<details>
  <summary>Input IMG</summary>
  
  <img src="media/img.gif" height="400">

   ### *ImagenPerfil*
  This Widget shows only an image, the *imgPath* field accepts either a url or a file address

```dart
  ImagenPerfil(
    required imgPath: String,
    elevation: double?,
    borderRadius = BorderRadius.zero,
    color: Color?,
    child: Widget?,
    height: double?,
    width: double?,
  )
```

### *SubuirFotos*
The *SubuirFotos* class has the functions to choose how to upload the images.

- `getImageLibrary`:
  Directly open the phone gallery to be able to choose an image
- `cameraImage`:
  Directly open the phone camera to take the picture
- `selectCamera`:
  Open a modal so that the user can choose if the image is taken by the camera or from the gallery
  
  
### *ImageFormField*
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
  <summary>Input Chip</summary>
  

  ### *ChipField* / *ChipFormField*
  ChipField/ChipFormField is a text type widget that allows you to separate things with chips.

  <img src="media/chip1.gif" height="400">


```dart
ChipField(
    decoration: InputDecoration?,
    initValue: List<ChipItem<T>?>?,
    onChanged: Function(List<ChipItem<T>?>)?,
    onSubmitted: Function(List<ChipItem<T>?>)?,
    chipLabelStyle: TextStyle?,
    chipBackgroundColor: Color?,
    chipDeleteIconColor: Color?,
  )
```

```dart
ChipFormField(
    decoration:InputDecoration?,
    onChanged:List<ChipItem<T>>?,
    onSubmitted:Function(List<ChipItem<T>?>)?,
    chipLabelStyle:Function(List<ChipItem<T>?>)?,
    chipBackgroundColor:TextStyle?,
    chipDeleteIconColor:Color?,
    onSaved:Color?,
    validator:void Function(List<ChipItem<T>?>?)?,
    initialValue:String? Function(List<ChipItem<T>?>?)?,
  )
```
### *ChipDialog*
ChipDialog displays a Dialog to be able to choose between already established options.

  <img src="media/chip2.gif" height="400">

```dart
 ChipDialog(
    decoration: InputDecoration?,
    data: List<ChipItem>, // required
    chipBuilder: Chip Function(ChipItem<T>?), // required
    selectChipBuilder: Chip Function(ChipItem<T>?)?,
    onChanged: void Function(List<T>), // required
  )
```
  
</details>

<details>
  <summary>Imput Select</summary>

  ### *SelectField*
  The SelectField Widget is the same as a TextField with the addition of a popup list that will be updated as the TextField is written.

  <img src="media/select.gif" height="400">


</details>
