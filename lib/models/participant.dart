import 'package:json_annotation/json_annotation.dart';

part 'participant.g.dart';

@JsonSerializable()
class Participant{
  final String name;
  final String avatar;

  const Participant({required this.name, required this.avatar} );

  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);

}