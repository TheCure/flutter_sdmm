// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInfoBean _$MyInfoBeanFromJson(Map<String, dynamic> json) {
  return MyInfoBean(
    json['name'] as String,
    json['img'] as String,
    json['work'] as int,
    json['post'] as String,
    json['skill'] as String,
    json['user'] as int,
  );
}

Map<String, dynamic> _$MyInfoBeanToJson(MyInfoBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'work': instance.work,
      'post': instance.post,
      'skill': instance.skill,
      'user': instance.user,
    };
