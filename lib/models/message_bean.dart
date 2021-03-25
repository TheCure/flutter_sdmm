import 'package:json_annotation/json_annotation.dart';

part 'message_bean.g.dart';


@JsonSerializable()
class MessageBean extends Object {

  @JsonKey(name: 'list')
  List<ListBean> list;

  MessageBean(this.list,);

  factory MessageBean.fromJson(Map<String, dynamic> srcJson) => _$MessageBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageBeanToJson(this);

}


@JsonSerializable()
class ListBean extends Object {

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'depict')
  String depict;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'num')
  int num;

  ListBean(this.state,this.title,this.depict,this.img,this.num,);

  factory ListBean.fromJson(Map<String, dynamic> srcJson) => _$ListBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListBeanToJson(this);

}


