// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launchpad _$LaunchpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launchpad',
      json,
      ($checkedConvert) {
        final val = Launchpad(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LaunchpadToJson(Launchpad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
