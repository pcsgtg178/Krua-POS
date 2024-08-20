// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userCode: json['userCode'] as String,
      userName: json['userName'] as String,
      passwordEncode: json['passwordEncode'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userCode': instance.userCode,
      'userName': instance.userName,
      'passwordEncode': instance.passwordEncode,
    };
