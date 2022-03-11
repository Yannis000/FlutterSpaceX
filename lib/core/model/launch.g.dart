// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          name: $checkedConvert('name', (v) => v as String?),
          dateUtc: $checkedConvert('date_utc', (v) => v as String?),
          dateUnix: $checkedConvert('date_unix', (v) => v as int?),
          dateLocal: $checkedConvert('date_local', (v) => v as String?),
          success: $checkedConvert('success', (v) => v as bool?),
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'dateUtc': 'date_utc',
        'dateUnix': 'date_unix',
        'dateLocal': 'date_local'
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'name': instance.name,
      'date_utc': instance.dateUtc,
      'date_unix': instance.dateUnix,
      'date_local': instance.dateLocal,
      'success': instance.success,
      'links': instance.links?.toJson(),
    };
