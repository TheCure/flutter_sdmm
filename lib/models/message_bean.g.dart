// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageBean _$MessageBeanFromJson(Map<String, dynamic> json) {
  return MessageBean(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ListBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MessageBeanToJson(MessageBean instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

ListBean _$ListBeanFromJson(Map<String, dynamic> json) {
  return ListBean(
    json['state'] as int,
    json['title'] as String,
    json['depict'] as String,
    json['img'] as String,
    json['num'] as int,
  );
}

Map<String, dynamic> _$ListBeanToJson(ListBean instance) => <String, dynamic>{
      'state': instance.state,
      'title': instance.title,
      'depict': instance.depict,
      'img': instance.img,
      'num': instance.num,
    };
