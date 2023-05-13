import 'package:json_annotation/json_annotation.dart';

part 'last_message.g.dart';

@JsonSerializable()
class LastMessage{
  final String message;
  final String sender;


  const LastMessage({required this.message, required this.sender} );

  factory LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);

}
