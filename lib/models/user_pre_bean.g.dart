// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pre_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreBean _$UserPreBeanFromJson(Map<String, dynamic> json) {
  return UserPreBean(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ListBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
  );
}

Map<String, dynamic> _$UserPreBeanToJson(UserPreBean instance) =>
    <String, dynamic>{
      'list': instance.list,
      'count': instance.count,
    };

ListBean _$ListBeanFromJson(Map<String, dynamic> json) {
  return ListBean(
    json['ordernum'] as String,
    json['name'] as String,
    json['num'] as int,
    json['num1'] as int,
    json['jis'] as String,
    json['zt'] as String,
    json['is_bai'] as int,
    json['is_new'] as int,
    json['jis_name'] as String,
    json['time'] as String,
  );
}

Map<String, dynamic> _$ListBeanToJson(ListBean instance) => <String, dynamic>{
      'ordernum': instance.ordernum,
      'name': instance.name,
      'num': instance.num,
      'num1': instance.num1,
      'jis': instance.jis,
      'zt': instance.zt,
      'is_bai': instance.isBai,
      'is_new': instance.isNew,
      'jis_name': instance.jisName,
      'time': instance.time,
    };
