import 'package:connect_with_telegrambot/domain/model/telegramChannelModel.dart';
import 'package:connect_with_telegrambot/domain/service/TelegramService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telegram bot chat"),
      ),
      body: FutureBuilder(
          future: TelegramService().getUpdates(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.data is String) {
              return Center(
                child: Text(snapshot.data),
              );
            } else {
              TelegramChannelModel data = snapshot.data as TelegramChannelModel;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data.result[index].message!.text.toString()),
                  );
                },
                itemCount: data.result.length,
              );
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextFormField(
        controller: _messageController,
        decoration: InputDecoration(
            hintText: "message",
            suffixIcon: IconButton(
                onPressed: () async {
                  TelegramService()
                      .sendMessage(_messageController.text)
                      .then((value) => _messageController.clear());
                },
                icon: const Icon(Icons.send))),
      ),
    );
  }
}
