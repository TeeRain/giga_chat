import 'package:json_annotation/json_annotation.dart';

part 'message_chip.g.dart';

@JsonSerializable()
class MessageChip{
  final String label;
  final String backColor;
  final String textColor;

  const MessageChip({required this.label, required this.backColor,required this.textColor} );

  factory MessageChip.fromJson(Map<String, dynamic> json) => _$MessageChipFromJson(json);

}