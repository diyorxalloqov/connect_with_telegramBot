import 'dart:convert';

class TelegramChannelModel {
    final bool ok;
    final List<Result> result;

    TelegramChannelModel({
        required this.ok,
        required this.result,
    });

    factory TelegramChannelModel.fromRawJson(String str) => TelegramChannelModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TelegramChannelModel.fromJson(Map<String, dynamic> json) => TelegramChannelModel(
        ok: json["ok"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    final int updateId;
    final Message? message;
    final MyChatMember? myChatMember;

    Result({
        required this.updateId,
        this.message,
        this.myChatMember,
    });

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        updateId: json["update_id"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        myChatMember: json["my_chat_member"] == null ? null : MyChatMember.fromJson(json["my_chat_member"]),
    );

    Map<String, dynamic> toJson() => {
        "update_id": updateId,
        "message": message?.toJson(),
        "my_chat_member": myChatMember?.toJson(),
    };
}

class Message {
    final int messageId;
    final From from;
    final MessageChat chat;
    final int date;
    final String text;

    Message({
        required this.messageId,
        required this.from,
        required this.chat,
        required this.date,
        required this.text,
    });

    factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        from: From.fromJson(json["from"]),
        chat: MessageChat.fromJson(json["chat"]),
        date: json["date"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "from": from.toJson(),
        "chat": chat.toJson(),
        "date": date,
        "text": text,
    };
}

class MessageChat {
    final int id;
    final String firstName;
    final String lastName;
    final String username;
    final String type;

    MessageChat({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.type,
    });

    factory MessageChat.fromRawJson(String str) => MessageChat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MessageChat.fromJson(Map<String, dynamic> json) => MessageChat(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "type": type,
    };
}

class From {
    final int id;
    final bool isBot;
    final String firstName;
    final String lastName;
    final String username;
    final String languageCode;

    From({
        required this.id,
        required this.isBot,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.languageCode,
    });

    factory From.fromRawJson(String str) => From.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"],
        isBot: json["is_bot"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        languageCode: json["language_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_bot": isBot,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "language_code": languageCode,
    };
}

class MyChatMember {
    final MyChatMemberChat chat;
    final From from;
    final int date;
    final OldChatMember oldChatMember;
    final NewChatMember newChatMember;

    MyChatMember({
        required this.chat,
        required this.from,
        required this.date,
        required this.oldChatMember,
        required this.newChatMember,
    });

    factory MyChatMember.fromRawJson(String str) => MyChatMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MyChatMember.fromJson(Map<String, dynamic> json) => MyChatMember(
        chat: MyChatMemberChat.fromJson(json["chat"]),
        from: From.fromJson(json["from"]),
        date: json["date"],
        oldChatMember: OldChatMember.fromJson(json["old_chat_member"]),
        newChatMember: NewChatMember.fromJson(json["new_chat_member"]),
    );

    Map<String, dynamic> toJson() => {
        "chat": chat.toJson(),
        "from": from.toJson(),
        "date": date,
        "old_chat_member": oldChatMember.toJson(),
        "new_chat_member": newChatMember.toJson(),
    };
}

class MyChatMemberChat {
    final int id;
    final String title;
    final String username;
    final String type;

    MyChatMemberChat({
        required this.id,
        required this.title,
        required this.username,
        required this.type,
    });

    factory MyChatMemberChat.fromRawJson(String str) => MyChatMemberChat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MyChatMemberChat.fromJson(Map<String, dynamic> json) => MyChatMemberChat(
        id: json["id"],
        title: json["title"],
        username: json["username"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "username": username,
        "type": type,
    };
}

class NewChatMember {
    final User user;
    final String status;
    final bool canBeEdited;
    final bool canManageChat;
    final bool canChangeInfo;
    final bool canPostMessages;
    final bool canEditMessages;
    final bool canDeleteMessages;
    final bool canInviteUsers;
    final bool canRestrictMembers;
    final bool canPromoteMembers;
    final bool canManageVideoChats;
    final bool isAnonymous;
    final bool canManageVoiceChats;

    NewChatMember({
        required this.user,
        required this.status,
        required this.canBeEdited,
        required this.canManageChat,
        required this.canChangeInfo,
        required this.canPostMessages,
        required this.canEditMessages,
        required this.canDeleteMessages,
        required this.canInviteUsers,
        required this.canRestrictMembers,
        required this.canPromoteMembers,
        required this.canManageVideoChats,
        required this.isAnonymous,
        required this.canManageVoiceChats,
    });

    factory NewChatMember.fromRawJson(String str) => NewChatMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewChatMember.fromJson(Map<String, dynamic> json) => NewChatMember(
        user: User.fromJson(json["user"]),
        status: json["status"],
        canBeEdited: json["can_be_edited"],
        canManageChat: json["can_manage_chat"],
        canChangeInfo: json["can_change_info"],
        canPostMessages: json["can_post_messages"],
        canEditMessages: json["can_edit_messages"],
        canDeleteMessages: json["can_delete_messages"],
        canInviteUsers: json["can_invite_users"],
        canRestrictMembers: json["can_restrict_members"],
        canPromoteMembers: json["can_promote_members"],
        canManageVideoChats: json["can_manage_video_chats"],
        isAnonymous: json["is_anonymous"],
        canManageVoiceChats: json["can_manage_voice_chats"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "status": status,
        "can_be_edited": canBeEdited,
        "can_manage_chat": canManageChat,
        "can_change_info": canChangeInfo,
        "can_post_messages": canPostMessages,
        "can_edit_messages": canEditMessages,
        "can_delete_messages": canDeleteMessages,
        "can_invite_users": canInviteUsers,
        "can_restrict_members": canRestrictMembers,
        "can_promote_members": canPromoteMembers,
        "can_manage_video_chats": canManageVideoChats,
        "is_anonymous": isAnonymous,
        "can_manage_voice_chats": canManageVoiceChats,
    };
}

class User {
    final int id;
    final bool isBot;
    final String firstName;
    final String username;

    User({
        required this.id,
        required this.isBot,
        required this.firstName,
        required this.username,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isBot: json["is_bot"],
        firstName: json["first_name"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_bot": isBot,
        "first_name": firstName,
        "username": username,
    };
}

class OldChatMember {
    final User user;
    final String status;

    OldChatMember({
        required this.user,
        required this.status,
    });

    factory OldChatMember.fromRawJson(String str) => OldChatMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OldChatMember.fromJson(Map<String, dynamic> json) => OldChatMember(
        user: User.fromJson(json["user"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "status": status,
    };
}
