//Esta es la entidad de los datos que vamos a manejar en la aplicacion para los mensajes
//Lo siguiente que se crea es un provider para indicarle cuando tiene que actualizar la UI

enum FromWho { me, her }

class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });

}