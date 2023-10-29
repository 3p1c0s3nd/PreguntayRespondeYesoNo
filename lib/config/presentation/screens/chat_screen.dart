import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/config/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/config/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnoapp/config/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnoapp/config/presentation/widgets/shared/message_field_box.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200')),
          ), //Es una imagen que usamos para mostrar antes del texto
          title: const Text('El Socio 👌'),
          centerTitle: true,
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  /*const _ChatView({
    super.key,
  });*/

  @override
  Widget build(BuildContext context) {
    //Estar pendiente de los cambios para asi poder redibujar el widget
    final chatProvider = context.watch<
        ChatProvider>(); //Pone a la escucha antes cualquier cambio en ChatProvider
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10), //Hace un padding vertical y horizontal igual
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                controller: chatProvider.chatscrollController,
                  itemBuilder: (context, index) {
                    //Si el index es pare devuelve un MyMessageBubble y si es impar devuelve un HerMessageBubble
                    /*return (index % 2 == 0)
                        ? const HerMessageBubble()
                        : const MyMessageBubble();*/
                    final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.me)
                        ? MyMessageBubble(
                            message: message,
                          )
                        : HerMessageBubble(message: message);
                  },
                  itemCount:
                      chatProvider.messageList.length) //Cantidad de mensajes
              ),

          //Caja de mensajes
          MessageFieldBox(
            /*onValue: (value) {
              chatProvider.sendMessage(value);
            }*/
            onValue : chatProvider.sendMessage
          ),
        ]),
      ),
    );
  }
}
