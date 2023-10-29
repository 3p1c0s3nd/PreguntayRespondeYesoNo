import 'package:flutter/material.dart';
import 'package:yesnoapp/config/Constantes.dart';

const Color _customColor = Color.fromRGBO(255, 255, 255, 0.5);
const Color _customColor2 = Color(0xFF49149F);


const List<Color> _colorThemes = [
  _customColor,
  _customColor2,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.blueGrey,
  Colors.purple,
  Colors.pink

];
class AppTheme {
  final int selectedColor;//Creamos un parametro de tipo int
  AppTheme({this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 'SelectedColor must be between 0 and ${_colorThemes.length - 1}');//Creamos el constructor con un parametro de tipo int

  ThemeData miTema() {
    return ThemeData(
      useMaterial3: useMaterial3,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}
