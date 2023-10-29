import 'package:dio/dio.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/infrastructure/models/yesno_model.dart';

class GetYesNoAnswer {
  final Dio dio = Dio();

  Future<Message> getAnswer() async {
    final response = await dio.get('https://yesno.wtf/api');
    final YesNoModel yesnoModel = YesNoModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return yesnoModel.toMessageEntity();
    }
    return Message(
        text: 'Something went wrong',
        fromWho: FromWho.me,
        imageUrl: 'https://picsum.photos/200');
  }
}
