import 'package:json_annotation/json_annotation.dart';

part 'login_bean.g.dart';


@JsonSerializable()
class LoginBean extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'manage_type')
  int manageType;

  @JsonKey(name: 'manage_val')
  List<String> manageVal;

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'head_img')
  String headImg;

  @JsonKey(name: 'skill_level')
  int skillLevel;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'join_code')
  List<Join_code> joinCode;

  @JsonKey(name: 'token')
  String token;

  LoginBean(this.id,this.manageType,this.manageVal,this.account,this.name,this.phone,this.headImg,this.skillLevel,this.password,this.joinCode,this.token,);

  factory LoginBean.fromJson(Map<String, dynamic> srcJson) => _$LoginBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginBeanToJson(this);

}


@JsonSerializable()
class Join_code extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'join_logo')
  String joinLogo;

  @JsonKey(name: 'fram_id')
  int framId;

  @JsonKey(name: 'function_id')
  int functionId;

  @JsonKey(name: 'fram_name_id')
  int framNameId;

  @JsonKey(name: 'join_state')
  int joinState;

  @JsonKey(name: 'fram_list')
  List<Fram_list> framList;

  @JsonKey(name: 'is_boss')
  int isBoss;

  @JsonKey(name: 'fram_id_name')
  String framIdName;

  @JsonKey(name: 'fram_id_level')
  int framIdLevel;

  @JsonKey(name: 'fram_id_subset')
  int framIdSubset;

  @JsonKey(name: 'fram_id_is_observer')
  int framIdIsObserver;

  @JsonKey(name: 'purview')
  List<String> purview;

  @JsonKey(name: 'framework_function_name')
  String frameworkFunctionName;

  @JsonKey(name: 'framework_function_main_role')
  int frameworkFunctionMainRole;

  @JsonKey(name: 'framework_function_role')
  List<String> frameworkFunctionRole;

  Join_code(this.code,this.name,this.joinLogo,this.framId,this.functionId,this.framNameId,this.joinState,this.framList,this.isBoss,this.framIdName,this.framIdLevel,this.framIdSubset,this.framIdIsObserver,this.purview,this.frameworkFunctionName,this.frameworkFunctionMainRole,this.frameworkFunctionRole,);

  factory Join_code.fromJson(Map<String, dynamic> srcJson) => _$Join_codeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Join_codeToJson(this);

}


@JsonSerializable()
class Fram_list extends Object {

  @JsonKey(name: 'fram_name_id')
  int framNameId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'main_role')
  int mainRole;

  Fram_list(this.framNameId,this.name,this.level,this.mainRole,);

  factory Fram_list.fromJson(Map<String, dynamic> srcJson) => _$Fram_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Fram_listToJson(this);

}


