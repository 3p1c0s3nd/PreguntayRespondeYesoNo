import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/config/Constantes.dart';
import 'package:yesnoapp/config/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/config/presentation/screens/chat_screen.dart';
import 'package:yesnoapp/config/themes/Theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //El multiProvider nos permite agrupar los providers en un solo, compartir el estado entre los providers
    //El chat_provider se crea a en toda la aplicacion
    //Todos los widget hijos de MultiProvider tienen accesso al estado de todos los providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),//Como no se usa el argumento se coloca el _
        )
      ],
      child: MaterialApp(
        title: tituloApp,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: colorthema).miTema(),
        home:const ChatScreen(),
      ),
    );
  }
}
