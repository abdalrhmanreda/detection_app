// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      device: json['device'] as String?,
      roomName: json['roomName'] as String?,
      version: (json['version'] as num?)?.toDouble(),
      state: json['state'] as String?,
      link: json['link'] as String?,
      xda: json['xda'] as String?,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'device': instance.device,
      'roomName': instance.roomName,
      'version': instance.version,
      'state': instance.state,
      'link': instance.link,
      'xda': instance.xda,
    };
