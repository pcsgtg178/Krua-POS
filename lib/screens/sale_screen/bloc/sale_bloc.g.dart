// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleState _$SaleStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SaleState',
      json,
      ($checkedConvert) {
        final val = SaleState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$ScreenStatusEnumMap, v) ??
                  ScreenStatus.initial),
          receipt: $checkedConvert(
              'receipt',
              (v) => v == null
                  ? null
                  : Receipt.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SaleStateToJson(SaleState instance) => <String, dynamic>{
      'status': _$ScreenStatusEnumMap[instance.status]!,
      'receipt': instance.receipt.toJson(),
    };

const _$ScreenStatusEnumMap = {
  ScreenStatus.initial: 'initial',
  ScreenStatus.loading: 'loading',
  ScreenStatus.success: 'success',
  ScreenStatus.failure: 'failure',
};
