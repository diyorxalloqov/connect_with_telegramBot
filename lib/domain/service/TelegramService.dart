import 'package:connect_with_telegrambot/domain/model/telegramChannelModel.dart';
import 'package:dio/dio.dart';

class TelegramService {
  final String _token = "6642421832:AAGwAOTr4Bs_m-Ng0vgeVG2yUdiKUptmy3g";
  final String _chatId = "-1001708113398";

  Future<dynamic> getUpdates() async {
    try {
      Response response =
          await Dio().get("https://api.telegram.org/bot$_token/getUpdates");
      if (response.statusCode == 200) {
        return TelegramChannelModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> sendMessage(String message) async {
    try {
      final Uri uri = Uri.https('api.telegram.org', '/bot$_token/sendMessage', {
        "chat_id": _chatId,
        "text": {
          "from": "Diyor",
          "text": message,
          "created_at": DateTime.now().year.toString()
        }.toString()
      });
      await Dio().getUri(uri);
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
