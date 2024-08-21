// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$UserImpl',
      json,
      ($checkedConvert) {
        final val = _$UserImpl(
          userCode: $checkedConvert('user_code', (v) => v as String),
          userName: $checkedConvert('user_name', (v) => v as String),
          passwordEncode:
              $checkedConvert('password_encode', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'userCode': 'user_code',
        'userName': 'user_name',
        'passwordEncode': 'password_encode'
      },
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'user_code': instance.userCode,
      'user_name': instance.userName,
      'password_encode': instance.passwordEncode,
    };
