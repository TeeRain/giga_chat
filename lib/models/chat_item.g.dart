// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) => ChatItem(
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      chip: json['chip'] == null
          ? null
          : MessageChip.fromJson(json['chip'] as Map<String, dynamic>),
      lastMessage:
          LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ChatItemToJson(ChatItem instance) => <String, dynamic>{
      'participants': instance.participants,
      'chip': instance.chip,
      'lastMessage': instance.lastMessage,
      'date': instance.date.toIso8601String(),
    };
