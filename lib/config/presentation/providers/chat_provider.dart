//Los providers son gestores de estado
import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yesnoanswer.dart';
import 'package:yesnoapp/domain/entities/message.dart';



class ChatProvider extends ChangeNotifier {


  final ScrollController chatscrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(
      text: 'Hola este es el primer mensaje',
      fromWho: FromWho.me
    ),
    Message(
      text: 'Hola este es el segundo mensaje, ya regresaste del trabajo?',
      fromWho: FromWho.me
    ),
  ];
  
  /*Future<void> sendMessage(Message message) async {
    messageList.add(message);
  }*/
  Future<void> sendMessage(String texto) async {
    if(texto.isEmpty) return;
    //TODO: Crear el mensaje
    final newMessage = Message(
      text: texto,
      fromWho: FromWho.me
    );
    messageList.add(newMessage);
    if(texto.endsWith('?')){
      await herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }


Future<void> herReply() async{
  //Este se va a lanzar cuando detecte el ? en el mensaje
  final herMessage = await getYesNoAnswer.getAnswer();
  messageList.add(herMessage);
  notifyListeners();
  moveScrollToBottom();

}

  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));//Esperamos 100 milesimas de segundo
    chatscrollController.animateTo(
      chatscrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}