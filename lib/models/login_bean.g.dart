// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBean _$LoginBeanFromJson(Map<String, dynamic> json) {
  return LoginBean(
    json['id'] as int,
    json['manage_type'] as int,
    (json['manage_val'] as List)?.map((e) => e as String)?.toList(),
    json['account'] as String,
    json['name'] as String,
    json['phone'] as String,
    json['head_img'] as String,
    json['skill_level'] as int,
    json['password'] as String,
    (json['join_code'] as List)
        ?.map((e) =>
            e == null ? null : Join_code.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['token'] as String,
  );
}

Map<String, dynamic> _$LoginBeanToJson(LoginBean instance) => <String, dynamic>{
      'id': instance.id,
      'manage_type': instance.manageType,
      'manage_val': instance.manageVal,
      'account': instance.account,
      'name': instance.name,
      'phone': instance.phone,
      'head_img': instance.headImg,
      'skill_level': instance.skillLevel,
      'password': instance.password,
      'join_code': instance.joinCode,
      'token': instance.token,
    };

Join_code _$Join_codeFromJson(Map<String, dynamic> json) {
  return Join_code(
    json['code'] as String,
    json['name'] as String,
    json['join_logo'] as String,
    json['fram_id'] as int,
    json['function_id'] as int,
    json['fram_name_id'] as int,
    json['join_state'] as int,
    (json['fram_list'] as List)
        ?.map((e) =>
            e == null ? null : Fram_list.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['is_boss'] as int,
    json['fram_id_name'] as String,
    json['fram_id_level'] as int,
    json['fram_id_subset'] as int,
    json['fram_id_is_observer'] as int,
    (json['purview'] as List)?.map((e) => e as String)?.toList(),
    json['framework_function_name'] as String,
    json['framework_function_main_role'] as int,
    (json['framework_function_role'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$Join_codeToJson(Join_code instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'join_logo': instance.joinLogo,
      'fram_id': instance.framId,
      'function_id': instance.functionId,
      'fram_name_id': instance.framNameId,
      'join_state': instance.joinState,
      'fram_list': instance.framList,
      'is_boss': instance.isBoss,
      'fram_id_name': instance.framIdName,
      'fram_id_level': instance.framIdLevel,
      'fram_id_subset': instance.framIdSubset,
      'fram_id_is_observer': instance.framIdIsObserver,
      'purview': instance.purview,
      'framework_function_name': instance.frameworkFunctionName,
      'framework_function_main_role': instance.frameworkFunctionMainRole,
      'framework_function_role': instance.frameworkFunctionRole,
    };

Fram_list _$Fram_listFromJson(Map<String, dynamic> json) {
  return Fram_list(
    json['fram_name_id'] as int,
    json['name'] as String,
    json['level'] as int,
    json['main_role'] as int,
  );
}

Map<String, dynamic> _$Fram_listToJson(Fram_list instance) => <String, dynamic>{
      'fram_name_id': instance.framNameId,
      'name': instance.name,
      'level': instance.level,
      'main_role': instance.mainRole,
    };
