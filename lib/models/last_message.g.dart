// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
      message: json['message'] as String,
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sender': instance.sender,
    };
