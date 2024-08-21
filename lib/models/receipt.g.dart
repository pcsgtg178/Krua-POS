// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Receipt',
      json,
      ($checkedConvert) {
        final val = Receipt(
          receiptId: $checkedConvert('receipt_id', (v) => v as String),
          itemList: $checkedConvert('item_list',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'receiptId': 'receipt_id', 'itemList': 'item_list'},
    );

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'receipt_id': instance.receiptId,
      'item_list': instance.itemList,
    };
