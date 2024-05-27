// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      authMethod: $enumDecode(_$AuthMethodEnumMap, json['authMethod']),
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authMethod': _$AuthMethodEnumMap[instance.authMethod]!,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };

const _$AuthMethodEnumMap = {
  AuthMethod.email: 'email',
  AuthMethod.facebook: 'facebook',
  AuthMethod.google: 'google',
  AuthMethod.apple: 'apple',
};
