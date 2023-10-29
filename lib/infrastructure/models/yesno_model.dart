// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);


import 'package:yesnoapp/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool? force;
    final String image;

    YesNoModel({
        required this.answer,
        required this.force,
        required this.image,
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        force: json["force"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "force": force,
        "image": image,
    };


    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', 
      fromWho: FromWho.her,
      imageUrl: image
      );
    
}
