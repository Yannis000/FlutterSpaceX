// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Crew',
      json,
      ($checkedConvert) {
        final val = Crew(
          name: $checkedConvert('name', (v) => v as String?),
          agency: $checkedConvert('agency', (v) => v as String?),
          image: $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'name': instance.name,
      'agency': instance.agency,
      'image': instance.image,
    };
