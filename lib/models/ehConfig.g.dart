// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ehConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EhConfig _$EhConfigFromJson(Map<String, dynamic> json) {
  return EhConfig()
    ..jpnTitle = json['jpnTitle'] as bool
    ..tagTranslat = json['tagTranslat'] as bool
    ..favoritesOrder = json['favoritesOrder'] as String
    ..galleryImgBlur = json['galleryImgBlur'] as bool;
}

Map<String, dynamic> _$EhConfigToJson(EhConfig instance) => <String, dynamic>{
      'jpnTitle': instance.jpnTitle,
      'tagTranslat': instance.tagTranslat,
      'favoritesOrder': instance.favoritesOrder,
      'galleryImgBlur': instance.galleryImgBlur
    };