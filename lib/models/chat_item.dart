import 'package:json_annotation/json_annotation.dart';

import 'package:giga_chat/models/last_message.dart';
import 'package:giga_chat/models/message_chip.dart';
import 'package:giga_chat/models/participant.dart';

part 'chat_item.g.dart';

@JsonSerializable()
class ChatItem {
   final List<Participant> participants;
   final MessageChip? chip;
   final LastMessage lastMessage;
   final DateTime date;

  const ChatItem({
    required this.participants,
    this.chip,
    required this.lastMessage,
    required this.date,
  });

    factory ChatItem.fromJson(Map<String, dynamic> json) => _$ChatItemFromJson(json);

}
