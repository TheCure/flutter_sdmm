import 'package:json_annotation/json_annotation.dart';

part 'user_pre_bean.g.dart';

@JsonSerializable()
class UserPreBean extends Object {
  @JsonKey(name: 'list')
  List<ListBean> list;

  @JsonKey(name: 'count')
  int count;

  UserPreBean(
    this.list,
    this.count,
  );

  factory UserPreBean.fromJson(Map<String, dynamic> srcJson) =>
      _$UserPreBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserPreBeanToJson(this);
}

@JsonSerializable()
class ListBean extends Object {
  @JsonKey(name: 'ordernum')
  String ordernum;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'num')
  int num;

  @JsonKey(name: 'num1')
  int num1;

  @JsonKey(name: 'jis')
  String jis;

  @JsonKey(name: 'zt')
  String zt;

  @JsonKey(name: 'is_bai')
  int isBai;

  @JsonKey(name: 'is_new')
  int isNew;

  @JsonKey(name: 'jis_name')
  String jisName;

  @JsonKey(name: 'time')
  String time;

  ListBean(
    this.ordernum,
    this.name,
    this.num,
    this.num1,
    this.jis,
    this.zt,
    this.isBai,
    this.isNew,
    this.jisName,
    this.time,
  );

  factory ListBean.fromJson(Map<String, dynamic> srcJson) =>
      _$ListBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListBeanToJson(this);
}
