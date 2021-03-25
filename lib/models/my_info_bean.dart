import 'package:json_annotation/json_annotation.dart';

part 'my_info_bean.g.dart';


@JsonSerializable()
class MyInfoBean extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'work')
  int work;

  @JsonKey(name: 'post')
  String post;

  @JsonKey(name: 'skill')
  String skill;

  @JsonKey(name: 'user')
  int user;

  MyInfoBean(this.name,this.img,this.work,this.post,this.skill,this.user,);

  factory MyInfoBean.fromJson(Map<String, dynamic> srcJson) => _$MyInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyInfoBeanToJson(this);

}


