
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userCode,
    required String userName,
    required String passwordEncode
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}