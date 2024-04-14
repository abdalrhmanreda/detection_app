import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  String? device;
  String? roomName;
  double? version;
  String? state;
  String? link;
  String? xda;

  RoomModel({
    this.device,
    this.roomName,
    this.version,
    this.state,
    this.link,
    this.xda,
  });

  // Generate a factory constructor for deserialization
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  // Generate a method to serialize the object to a JSON map
  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
