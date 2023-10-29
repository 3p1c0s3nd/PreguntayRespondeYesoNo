import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController =
        TextEditingController(); //Nos da control sobre el input que lo asociemos
    final focusNode = FocusNode(); // Nos permite hacer focus en el input

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputTextDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      hintText: 'Termina tu mensaje con un "?"...',
      hintStyle: TextStyle(color: colors.primary),
      focusedBorder: outlineInputBorder,
      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
          icon: Icon(Icons.send_rounded)),
    );

    return TextFormField(
      //Cuando click fuera del campo input se quita el foco
      onTapOutside: (event) {
        focusNode.unfocus();
      },

      keyboardAppearance: colors.brightness,
      focusNode: focusNode,
      controller: textController,
      decoration: inputTextDecoration,
      onFieldSubmitted: (value) {
        //Obtenemos el valor cuando se envia el mensaje
        onValue(value);
        textController.clear(); //Limpiamos el input o todo lo que escribimos
        focusNode.requestFocus();
      },
      /*onChanged: (value) {
        //obtenemos el valor cuando oprime una tecla
        print('value Change: $value');
      },*/
    );
  }
}
